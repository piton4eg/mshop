Mshop::Application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get     'login' => :new
    post    'login' => :create
    delete  'logout' => :destroy
  end

  resources :products
  resources :line_items
  resources :carts
  resources :orders, except: [:show]
  resources :users
  resources :posts

  get '/contact' => 'static_pages#contact'
  get '/about' => 'static_pages#about'

  root to: 'store#index'
end
