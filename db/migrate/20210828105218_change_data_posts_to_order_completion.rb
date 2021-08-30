class ChangeDataPostsToOrderCompletion < ActiveRecord::Migration[6.1]
    def change
      change_column :posts, :order_completion, :integer
    end
end
