class AddLastNameAndTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :name, :first_name
    add_column :users, :type, :string, null: false, default: 'User'
    add_column :users, :last_name, :string
    add_index :users, :type
  end
end
