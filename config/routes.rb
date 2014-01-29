Mshop::Application.routes.draw do

  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'

  resources :products
  resources :line_items
  resources :carts
  resources :orders

  root to: 'store#index'
end
