class PostsController < ApplicationController

  def index
    @posts=Post.all
  end

  def show
    @post=Post.find(params[:id])
  end

  def new     
  end

  def create

    @post=Post.new(post_params) 

    if @post.save
      redirect_to posts_path
    else
      @error=@post.errors.full_messages
      render 'new'
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end


  private


  def post_params
    params.require(:post).permit(:author,:body)
  end

end
