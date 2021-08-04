class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :calculate_rating



  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end


  def calculate_rating
    @users=User.all.order(average_rating: :desc)
    @votes_up=UsersAverage.new.votes_down(@users)
    @votes_down=UsersAverage.new.votes_up(@users)
    @average_rating=UsersAverage.new.average_rating(@users)
  end
  
end
