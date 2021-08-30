class Order < ApplicationRecord

    validates :title, {presence: true, length: {maximum: 140}}
    validates :detail, {presence: true}
    validates :deadline, {presence: true}
    validates :category_id, {presence: true}
    validates :order_user_id, {presence: true}



end
