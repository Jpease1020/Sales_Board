Rails.application.routes.draw do

  # root "welcome#home"

  get '/'     => 'sessions#new'
  post '/'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :sales
  resources :users, only: [:show]

  namespace :admin do
    get '/' => 'display#index'
    post '/' => 'display#index'
    resources :users
  end
end
