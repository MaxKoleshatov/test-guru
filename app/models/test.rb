class Test < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  validates :title, presence: true,
                    uniqueness: { scope: :level }
                    
  validates :level, numericality: { only_integer: true, greater_than: 0 },
                    uniqueness: { scope: :title }

  scope :easy, -> {where(level: 0..1)}
  scope :medium, -> {where(level: 2..4)}
  scope :hard, -> {where(level: 5..Float::INFINITY)}
  scope :sort_tests_by_category, -> (category_title) {joins(:category)
  .where(categories: {title: category_title})
  .order(title: :desc)}
  scope :by_level, -> (level) {where(level: level)}

  def self.sort_tests_by_category(category)
    Test.sort_by_category(category)
        .order(title: :desc)
        .pluck(:title)
  end
end