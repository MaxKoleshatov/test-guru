class TestsUser < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :tests do |t|
      t.references :users, null: false, foreign_key: true
      t.references :tests, null: false, foreign_key: true
          
      t.timestamps
    end
  end
end
