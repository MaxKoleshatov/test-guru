class AddLastNameAndTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :first_name, :string
    add_column :users, :type, :string, null: false, default: 'User'
    add_column :users, :last_name, :string
    add_index :users, :type
  end
end
