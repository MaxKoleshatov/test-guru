class Badge < ApplicationRecord
  has_many :users_badges, dependent: :destroy
end