class AddColumnOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :category_id, :integer
    add_column :orders, :detail, :text
    add_column :orders, :deadline,:date
    add_column :orders, :contractor_id, :integer
    add_column :orders, :order_completion, :boolean
  end
end
