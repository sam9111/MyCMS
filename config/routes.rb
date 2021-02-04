Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :menu_items
  resources :menus
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#index"

  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_sessions

  get "/owner", to: "owner#index", as: :owner
  get "/customer", to: "customer#index", as: :customer
  get "/cart", to: "cart#index", as: :cart
end
