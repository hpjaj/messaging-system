Rails.application.routes.draw do

  devise_for :users
  resources :conversations, only: [:index, :create, :show, :destroy]

  root 'conversations#index'

end
