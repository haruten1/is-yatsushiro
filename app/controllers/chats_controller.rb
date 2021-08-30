class ChatsController < ApplicationController

    def send
        @chat = Chat.new(question_user_id:@current_user.id, answer_user_id:@post.order_user_id, comment:params[:comment])
        @chat.save
    end

end