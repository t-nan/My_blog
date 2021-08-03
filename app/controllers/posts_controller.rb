class PostsController < ApplicationController
  
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy ,:upvote ,:downvote]

  def index
    @posts = Post.all.order(cached_votes_score: :desc)

    @posts_count = Post.count

    @search = Post.ransack(params[:q])

    @p = @search.result(distinct: true)#paginate(page: params[:page], per_page: 10)
    
  end

  def upvote
    @post = Post.find(params[:id])
    if current_user.voted_up_on? @post
      @post.unvote_by current_user
    else
      @post.upvote_by current_user
    end
    render "vote.js.erb"
  end

  def downvote
    @post = Post.find(params[:id])
    if current_user.voted_down_on? @post
      @post.unvote_by current_user
    else
      @post.downvote_by current_user
    end
    render "vote.js.erb"
  end


  def show
    @post=Post.find(params[:id])
    @comments=@post.comments.order(created_at: :desc)
  end

  def new     
  end

  def create

    @post=Post.new(post_params) 

    if @post.save
      redirect_to posts_path, notice: "Your question has been saved!"
    else
      @error=@post.errors.full_messages
      render 'new'      
    end

  end

  def edit
    @post=Post.find(params[:id])
  end

  def update

    @post=Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      @error=@post.errors.full_messages
      render 'edit'
    end

  end

  def destroy
    @post=Post.find(params[:id])
    @post.delete
    redirect_to posts_path
  end


  private


  def post_params
    params.require(:post).permit(:user_id,:author,:tag,:body)
  end

end
