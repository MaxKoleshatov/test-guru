class Test < ApplicationRecord
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belong_to :author
  belong_to :category
  
  def self.sort_tests_by_category(category_title)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
