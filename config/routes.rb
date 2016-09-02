Rails.application.routes.draw do

  resources :users do
    resources :interests, controller: "UserInterests", only: [:index, :create, :destroy]
  end

  resources :interests do
    resources :users, controller: "InterestsUser", only: [:index, :create, :destroy]
  end

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
