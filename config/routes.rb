Rails.application.routes.draw do
  devise_for :users
  resources :schedules do
    resources :comments, only: [:new, :create, :destroy]
  end
  root to: "schedules#index"
  resources :rooms, only: [:new, :create]
end
