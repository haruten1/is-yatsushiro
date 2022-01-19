class UsersController < ApplicationController
    # 編集機能を実装するまで使わない
    # before_action :authenticate_user, {only: [:index,:show,:edit,:update]}

    before_action :forbid_login_user,{only: [:new, :create, :login_form, :login]}


    def new
        @user = User.new
    end

    def create
        @user =User.new(name:params[:name],belongs:params[:belongs],my_category_id:params[:my_category_id],mail:params[:mail],password:params[:password])
        @user.save

        if @user.save
            flash[:notice] ="ユーザー登録を完了しました！"
            redirect_to("/posts/index")
        else
            @name = params[:name]
            @belongs = params[:belongs]
            @mail = params[:mail]
            @password = params[:password]
            @error_message = "登録失敗：空欄の箇所があるか、idが既に使用されています"
            render("users/new")
        end
    end

    def login_form



    end

    def login
        @user = User.find_by(mail: params[:mail], password: params[:password])

        if @user
            session[:user_id] = @user.id
            flash[:notice] = "ログインしました"
            redirect_to("/posts/index")
        else
            @error_message = "メールアドレスまたはパスワードが間違っています"
            @mail = params[:mail]
            @password = params[:password]

            render("users/login_form")
        end
    end

    def login_sample
        @user = User.find_by(mail:"sample")
        session[:user_id] = @user.id
        flash[:notice] = "ログインしました"
        redirect_to("/posts/index")
    end

    def logout
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました"
        redirect_to("/login")
    end

    def user_page
        @user = User.find_by(id:params[:id])
        @post_order_now = Post.where(order_user_id:params[:id], order_completion:false)
        @post_order_now=@post_order_now.order(created_at: :desc)
        @post_order_finish = Post.where(order_user_id:params[:id],order_completion:true)
        @post_order_finish=@post_order_finish.order(created_at: :desc)
        @post_contractor =  Post.where(contractor_id:params[:id])
        @post_contractor=@post_contractor.order(created_at: :desc)

        @suggestion = Suggestion.where(user_id: params[:id])
        @suggestion=@suggestion.order(created_at: :desc)
        
        @days_left = (@post.deadline - today).to_i
    end
end