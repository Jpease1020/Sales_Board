Rails.application.routes.draw do
  get "login" => "sessions#new"
  post "login" => "sessions#create"

  resources :users, only: [:show]
end
