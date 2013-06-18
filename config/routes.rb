Er3DotNet::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  authenticated :user do
    root :to => 'home#index'
  end
  
  devise_for :users
  
  resources :users

  resources :tasks
  match "tag_cloud" => "tasks#tag_cloud"

  resources :companies
  
  root :to => "home#index"

end