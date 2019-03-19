Rails.application.routes.draw do
  get 'buses/new'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :buses, only: [:new, :create]
end
