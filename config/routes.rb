Rails.application.routes.draw do

  get "/" => "sessions#new"
  post "/" => "sessions#create"

  resources :users, only: [:show, :index]
  resources :sales

end
