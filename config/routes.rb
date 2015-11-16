Rails.application.routes.draw do

  root "welcome#home"

  get 'login'     => 'sessions#new'
  post 'login'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users, only: [:show, :index]
  resources :sales

end
