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
  
  match "languages" => "pages#languages"
  match "othersites" => "pages#othersites"
  match "about" => "pages#about"
  #match "contact" => "contact_us/contacts#new"
  #match "contact" => "pages#contact"
  
  resources :contacts,
    :controller => 'contact_us/contacts',
    :only       => [:new, :create]
  get 'contact' => 'contact_us/contacts#new', :as => :contact_us
  
  root :to => "pages#index"

end