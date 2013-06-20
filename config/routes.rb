Er3DotNet::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  authenticated :user do
    root :to => 'pages#index'
  end
  
  devise_for :users
  
  resources :users

  resources :tasks

  match "tag_cloud" => "tasks#tag_cloud"
  resources :companies
  
  get 'tag/:tag', to: 'tasks#index', as: :tag
  
  root :to => "pages#index"

end