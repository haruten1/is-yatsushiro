class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.integer :order_id
      t.integer :question_user_id
      t.integer :answer_user_id
      t.text :comment

      t.timestamps
    end
  end
end
