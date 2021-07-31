class UsersController < ApplicationController

  def index
    @users=User.all.order(average_rating: :desc)
    @votes_up=UsersAverage.new.votes_down(@users)
    @votes_down=UsersAverage.new.votes_up(@users)
    @average_rating=UsersAverage.new.average_rating(@users)
    
  end

  def show

    @user=User.find(params[:id])
    @posts=@user.posts.order(created_at: :desc)


  end
 

end
