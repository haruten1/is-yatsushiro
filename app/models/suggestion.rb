class Suggestion < ApplicationRecord
    validates :comment, {presence: true}

    def user
        return User.find_by(id:self.user_id)
    end

end
