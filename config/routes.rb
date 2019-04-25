Rails.application.routes.draw do
  get 'works/index'
  get 'works/new'
  get 'works/create'
  get 'works/show'
  get 'lines/edit'
  get 'lines/update'
  get 'deliveries/edit'
  get 'deliveries/update'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ferries, only: [:index, :show, :edit, :update, :destroy]
  resources :buses do
    resources :ferries, only: [:new, :create]
  end
  resources :orders
  resources :factory_orders, only: [:show, :edit, :update]
  resources :documents, only: [:new, :create, :show, :edit, :update]
  resources :deliveries, only: [:index, :show, :edit, :update]
  resources :lines, only: [:edit, :update]
  resources :works, only: [:new, :create, :edit, :update, :show]
end
