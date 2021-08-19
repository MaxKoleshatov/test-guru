class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"
  has_many :tests_users
  has_many :tests, through: :tests_users, dependent: :destroy

  validates :email, presence: true

  def user_tests_by_level(level)
    tests.by_level(level)
  end
end
