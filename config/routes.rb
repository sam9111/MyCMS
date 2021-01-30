Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :menu_items
  resources :menus
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#index"
end
