class Post < ApplicationRecord

    validates :title, {presence: true, length: {maximum: 140}}
    validates :detail, {presence: true}
    validates :deadline, {presence: true}
    validates :category_id, {presence: true}
    validates :order_user_id, {presence: true}

    def user
        return User.find_by(id:self.order_user_id)
    end

    def category
        return Category.find_by(id:self.category_id)
    end

    def suggestion_user
        return User.find_by(id:self.user_id)
    end

    def contractor
        return User.find_by(id:self.contractor_id)
    end

    def  suggestions_count
        suggestion = Suggestion.where(post_id:self.id)
        return  suggestion.count
    end

    def days_left
        today = Date.today
        return (self.deadline - today).to_i
    end

end
