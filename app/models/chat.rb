class Chat < ApplicationRecord
    validates :comment, {presence: true}

    def user
        return User.find_by(id:self.question_user_id)
    end
end
