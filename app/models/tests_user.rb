class TestsUser < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  CHECKPOINT_RESULT = 85

  def time_remaining
    time = (self.created_at + self.test.timer - Time.now).round(0)
  end

  def time_over?
    time_remaining <= 0
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if self.time_over? && self.test.timer != 0
      self.current_question = nil
      return
    end
    
    self.correct_questions += 1 if correct_answer?(answer_ids)
  
    self.current_question = next_question
    save!
  end

  def test_result
    @result = ((self.correct_questions / test.questions.count.to_f) *100).round(0)
  end

  def done?
    test_result > CHECKPOINT_RESULT
  end

  def number_current_question
    test.questions.order(:id).where('id < ?', self.current_question.id).count + 1
  end

  def check_answer_ids(answer_ids)
    answer_ids.present?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end