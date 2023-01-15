Rails.application.routes.draw do
  devise_for :users
  resources :item, only: :index
  root to: "schedules#index"
end
