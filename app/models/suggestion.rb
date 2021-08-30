class Suggestion < ApplicationRecord
    validates :comment, {presence: true}
end
