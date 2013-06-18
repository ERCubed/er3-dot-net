Er3DotNet::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  
  devise_for :users
  
  resources :users

  
  root :to => "home#index"

end