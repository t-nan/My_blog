Rails.application.routes.draw do
 
  devise_for :users
 

   root to: "posts#index"

    resources :users

    resources :posts do
      resources :comments
    end

    resources :posts do
      member do
        patch "upvote", to: "posts#upvote"
        patch "downvote", to: "posts#downvote"
      end
    end

end




  
