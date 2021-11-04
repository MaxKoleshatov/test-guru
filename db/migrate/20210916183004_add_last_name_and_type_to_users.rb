class AddLastNameAndTypeToUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :first_name, :string
    add_column :users, :type, :string, null: false, default: 'User'
    add_column :users, :last_name, :string
    add_index :users, :type
  end

  def down
    change_column :users, :first_name, :text
  end
end
