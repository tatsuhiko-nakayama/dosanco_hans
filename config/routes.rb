Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:edit, :update, :destroy, :show]
  resources :users do
    resources :cards, only: [:new, :create, :destroy]
  end
end
