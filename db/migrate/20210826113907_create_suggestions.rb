class CreateSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :suggestions do |t|
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
