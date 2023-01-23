Rails.application.routes.draw do
  devise_for :users
  resources :schedules do
    resources :comments, only: [:new, :create, :destroy]
  end
  root to: "schedules#index"
end
