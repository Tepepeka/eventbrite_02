Rails.application.routes.draw do
  get 'pages/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#show", page: "home"
  devise_for :users
  resources :events

  resources :users, only: %i[ show edit update destroy ] do
    resources :profil_pictures, only: %i[ create ]
  end

  namespace :admin do
    resources :users
  end

  post "/users/:user_id/events/:id", to: "attendances#create", as: "create_attending_event"
  delete "/users/:user_id/events/:id", to: "attendances#destroy", as: "destroy_attending_event"

end
