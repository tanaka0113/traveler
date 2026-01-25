Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show]

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  root "homes#top"
end
