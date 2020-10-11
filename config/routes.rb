Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:edit, :update, :destroy, :show] do
    resources :cards, only: [:new, :create, :destroy]
  end
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create, :destroy]
  end
end
