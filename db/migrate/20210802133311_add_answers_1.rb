class AddAnswers1 < ActiveRecord::Migration[6.1]
  def change
    change_column :answers, :correct, :boolean
    add_column :answers, :answer_client, :string
    add_reference :answers, :question, index: true, null: false
    add_foreign_key :answers, :questions
  end
end
