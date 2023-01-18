Rails.application.routes.draw do
  devise_for :users
  resources :schedules, only: [:index, :new, :create]
  root to: "schedules#index"
end
