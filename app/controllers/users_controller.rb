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

        puts @user
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

    def logout
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました"
        redirect_to("/login")
    end
end