class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> {where(correct: true)}

  validates :text, presence: true

  validate :answers_limit

  private

  def answers_limit
    if question.answers.count >= 4
      errors.add(:question, "Ответов должно быть не больше 4")
    else
    end
  end
end
