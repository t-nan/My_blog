# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index; end

  def show; end

  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to post_path(@post), notice: 'Your comment has been saved!'
    else
      redirect_to post_path, alert: 'Comment not saved ! Make sure that the forms are filled in correctly.'
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def comment_params
    params.require(:comment).permit(:author, :body, :user_id)
  end
end
