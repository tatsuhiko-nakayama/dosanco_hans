Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'items#index'
  resources :users, only: [:edit, :update, :destroy, :show] do
    resources :cards, only: [:new, :create, :destroy]
  end
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :categories do
    collection do
      get 'id2', 'id3', 'id4', 'id5', 'id6', 'id7', 'id8', 'id9', 'id10'
    end
  end
end
