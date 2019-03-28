Rails.application.routes.draw do
  get 'orders/new'
  get 'buses/new'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :buses
  resources :orders, only: [:new, :create, :show, :index]
  resources :factory_orders, only: [:edit, :update]
end
