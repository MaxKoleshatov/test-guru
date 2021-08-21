class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validate :answers_limit, on: :create

  scope :correct, -> {where(correct: true)}

  private

  def answers_limit
    if question.answers.count >= 4
      errors.add(:question, "Ответов должно быть не больше 4")
    end
  end
end
