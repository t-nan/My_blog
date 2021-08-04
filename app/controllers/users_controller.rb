class UsersController < ApplicationController

  def index
    @users=User.all.order(average_rating: :desc)
  end

  def show

    @user=User.find(params[:id])
    @posts=@user.posts.order(created_at: :desc)


  end
 

end
