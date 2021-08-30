class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :title
      t.integer :category_id
      t.text :detail
      t.integer :contractor_id
      t.date :deadline
      t.boolean :order_completion
      t.integer :order_user_id

      t.timestamps
    end
  end
end
