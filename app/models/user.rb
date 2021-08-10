class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users, dependent: :destroy

  def user_tests_by_level(level)
    Test.joins(:tests_users).where(level: level).where(tests_users: { user_id: id })
  end
end
