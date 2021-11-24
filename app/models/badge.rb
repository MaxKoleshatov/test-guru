class Badge < ApplicationRecord

  RULES = {category_rule: "Прошел все тесты категории",
          first_try_test_rule: "Прошел с первой попытки тест",
          level_rule: "Прошел все тесты уровня"}

  has_many :users_badges
end