Rails.application.routes.draw do
  get 'ferries/index'
  get 'ferries/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :buses
  resources :orders
  resources :factory_orders, only: [:show, :edit, :update]
  resources :documents, only: [:new, :create, :show, :edit, :update]
end
