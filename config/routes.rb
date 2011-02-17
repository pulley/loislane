Loislane::Application.routes.draw do
  get "archive" => "commits#index", :as => "archive"

  get "profile" => "users#edit", :as => "profile"
  resources :users, :only => [:update, :destroy]

  resources :commits do
    resources :voices, :only => [:create, :destroy]
  end

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  resources :sessions, :only => [:new, :create, :destroy]

  get "help" => "dashboard#help", :as => "help"

  root :to => "dashboard#start"
end
