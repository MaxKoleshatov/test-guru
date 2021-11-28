class User < ApplicationRecord
  
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :created_tests, class_name: "Test", foreign_key: "author_id"
  has_many :tests_users
  has_many :tests, through: :tests_users, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :users_badges
  has_many :badges, through: :users_badges, dependent: :destroy

  validates :email, presence: true,
                    uniqueness: { scope: :email, message: "данная почта уже зарегистрированна"},
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "не верный формат почты"}


  def user_tests_by_level(level)
    tests.by_level(level)
  end

  def tests_user(test)
    tests_users.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end

