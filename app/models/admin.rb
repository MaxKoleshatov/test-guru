class Admin < User
    validates :first_name, presence: true
end
