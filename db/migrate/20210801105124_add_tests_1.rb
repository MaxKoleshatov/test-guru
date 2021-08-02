class AddTests1 < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :user, index: true, null: false
    add_foreign_key :tests, :users   
  end
end
