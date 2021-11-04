class AddIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, :level
  end
end
