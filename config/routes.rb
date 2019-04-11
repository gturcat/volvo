Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ferries, only: [:index, :show]
  resources :buses do
    resources :ferries, only: [:new, :create]
  end
  resources :orders
  resources :factory_orders, only: [:show, :edit, :update]
  resources :documents, only: [:new, :create, :show, :edit, :update]
end
