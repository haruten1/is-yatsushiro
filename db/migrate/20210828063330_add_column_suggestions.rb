class AddColumnSuggestions < ActiveRecord::Migration[6.1]
  def change
    add_column :suggestions, :post_id, :integer
  end
end
