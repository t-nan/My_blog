# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :comments
    resources :posts
    resources :roles, only: %i[index show]

    root to: 'users#index'
  end
  devise_for :users

  root to: 'posts#index'

  resources :users

  resources :posts do
    resources :comments
  end

  resources :posts do
    member do
      patch 'upvote', to: 'posts#upvote'
      patch 'downvote', to: 'posts#downvote'
    end
  end
end
