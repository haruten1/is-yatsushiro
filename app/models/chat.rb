class Chat < ApplicationRecord
    validates :comment, {presence: true}
end
