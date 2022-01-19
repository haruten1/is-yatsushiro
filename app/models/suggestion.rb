class Suggestion < ApplicationRecord
    validates :comment, {presence: true}

    def user
        return User.find_by(id:self.user_id)
    end

    def suggestion_post
        return Post.find_by(id:self.post_id)
    end

end
