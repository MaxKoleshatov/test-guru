class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> {where(correct: true).pluck(:text)}

  private

  def number_of_responses
    error.add(:question, "Количество ответов должно быть не больше 4") if question.answers.count > 4
  end
end
