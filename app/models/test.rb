class Test < ApplicationRecord

   def self.m(category_title)
    self.joins('JOIN categories ON tests.category_id = categories.id')
    .where("categories.title = ?", category_title)
    .order("tests.id DESC")
    .pluck(:title)
   end
end

