class TestsUser < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  CHECKPOINT_RESULT = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
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