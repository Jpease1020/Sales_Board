Rails.application.routes.draw do

  # root "welcome#home"

  get '/'     => 'sessions#new'
  post '/'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :sales
  resources :users, only: [:show]

  namespace :admin do
    get 'home' => 'welcome#home'
    post 'home' => 'welcome#home'
    resources :users
  end
end
