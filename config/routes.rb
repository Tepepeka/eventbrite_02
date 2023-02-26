Rails.application.routes.draw do
  get 'pages/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#show", page: "home"
  devise_for :users
  resources :users, only: [:show] do
    resources :profil_pictures, only: [:create]
  end
  resources :events

  post "/users/:user_id/events/:id", to: "attendances#create", as: "create_attending_event"
  get "/users/:id/attented_events", to: "users#show_attended_events", as: "show_attended_events"
  delete "/users/:user_id/events/:id", to: "attendances#destroy", as: "destroy_attending_event"

end
