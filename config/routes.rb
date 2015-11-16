Rails.application.routes.draw do

  root "welcome#home"

  get 'login'     => 'sessions#new'
  post 'login'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :sales

  namespace :admin do
    get 'home' => 'welcome#home'
    resources :users
  end
end
