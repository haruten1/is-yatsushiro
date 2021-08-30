class User < ApplicationRecord
    validates :name, {presence: true}
    validates :mail, {presence: true, uniqueness: true}
    validates :belongs, {presence: true}

end
