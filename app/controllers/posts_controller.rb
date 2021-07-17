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
    params.require(:post).permit(:author,:body)
  end

end
