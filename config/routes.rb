Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  get 'orders/buses-bulk-update/:id' => 'orders#bulk_update', :as => 'bulk_update'
  post 'orders/buses-bulk-update-save/:id' => 'orders#bulk_update_save', :as => 'bulk_update_save'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ferries, only: [:index, :show, :edit, :update, :destroy]
  resources :buses do
    collection do
      get 'vn'
      get 'vo'
    end
    collection do
      get 'archive'
    end
    resources :ferries, only: [:create]
  end
  resources :orders do
    collection do
      get 'closed'
      get 'archive'
    end
    resources :buses do
      resources :lines, only: [:new, :create] do
        resources :trades, only: [:new, :create]
        resources :buses, only: [:new, :create]
        resources :trainings, only: [:new, :create]
      end
    end
  end

  resources :factory_orders, only: [:show, :edit, :update] do
    resources :partners
  end
  resources :documents, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :deliveries, only: [:index, :show, :edit, :update] do
    member do
      get 'close'
    end
    collection do
      get 'archive'
    end
  end
  resources :lines, only: [:edit, :update, :destroy]
  resources :works, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :trades, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get 'archive'
    end
    member do
      get 'close'
    end
  end
  resources :trainings, only: [:destroy]

  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
end
