class AddOrderUserIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_user_id, :integer
  end
end
