class TestsUser < ApplicationRecord
  belong_to :user
  belong_to :test
end