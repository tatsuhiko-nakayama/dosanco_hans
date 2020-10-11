Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:edit, :update, :destroy, :show]
  resources :users do
    resources :cards, only: [:new, :create, :destroy]
  end
  resources :items, only: [:index, :new, :create]
end
