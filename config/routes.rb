Er3DotNet::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  authenticated :user do
    root :to => 'pages#index'
  end
  
  devise_for :users
  
  resources :users

  resources :companies

  resources :tasks
  
  get 'tag/:tag', to: 'tasks#index', as: :tag
  match "tag_cloud" => "tasks#tag_cloud"
  match "resume" => "pages#resume"
  match "tumblr" => "pages#tumblr"
  match "tumblr/upload" => "pages#tumblr_upload"
  
  root :to => "pages#index"

end