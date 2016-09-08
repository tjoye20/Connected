Rails.application.routes.draw do

  post 'users/search' => "users#search"
  get 'users/:user_id/messageswith/:recipient_id' => "conversations#find"
  resources :users
  resources :interests

  resources :sessions, only: [:new, :create, :destroy]

  # we use a foreign key in the conversations table
  # to reference our user.
  resources :conversations do
    resources :messages
  end

  get "/signup", to: "users#new", as: "signup"
  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"

  root "users#new"

end
