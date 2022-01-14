class PostsController < ApplicationController
  before_action :authenticate_user 


  def index
    @post=Post.all.order(created_at: :desc)
    @today = Date.today
  end

  def index_category
    @post=Post.where(category_id:params[:id])
    @post=@post.order(created_at: :desc)
    @category=Category.find_by(id:params[:id])
    @today = Date.today
  end

  def show
    @post = Post.find_by(id:params[:id])
    @contractor = @post.contractor
    @user =  @post.user
    @category = @post.category
    today = Date.today
    @days_left = (@post.deadline - today).to_i

    @chat = Chat.where(order_id:params[:id])
  end

  def new
    
  end

  def create()
    @post =Post.new(title:params[:title],category_id:params[:category_id],deadline:params[:deadline],detail:params[:detail],order_completion:false,order_user_id:@current_user.id)
    @post.save
    if @post.save
      flash[:notice] ="依頼を投稿しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id:params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.save
    flash[:notice] ="依頼内容を修正しました"
    redirect_to("/posts/index")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] ="依頼を削除しました"
    redirect_to("/posts/index")
  end

  def suggestion
    @post = Post.find_by(id: params[:id])
  end

  def suggestion_create
    @suggestion =Suggestion.new(user_id:@current_user.id ,comment:params[:comment],post_id:params[:id],)
    @suggestion.save
    redirect_to("/posts/index")
  end

  def select
    @post = Post.find_by(id: params[:id])
    @suggestion = Suggestion.where(post_id: params[:id])
    @suggestion=@suggestion.order(created_at: :desc)
  end

  def select_decision
    @post = Post.find_by(id: params[:id])
    @post.order_completion = true
    @post.contractor_id = params[:suggestion_user_id]
    @post.save
    redirect_to("/posts/index")
  end

  def chat
    @post =Post.find_by(id:params[:id])
    @chat =Chat.new(comment:params[:comment],order_id:params[:id],question_user_id:@current_user.id,answer_user_id:@post.id)
    @chat.save
    redirect_to("/posts/#{@post.id}")
  end

  def admin_delete
    @post =Post.find_by(id:params[:id]).destroy
    @chat = Chat.where(order_id:params[:id]).destroy_all
    redirect_to("/")
  end

end
