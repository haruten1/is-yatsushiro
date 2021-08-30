class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.text :mail
      t.text :password
      t.text :belongs
      t.integer :my_category_id

      t.timestamps
    end
  end
end
