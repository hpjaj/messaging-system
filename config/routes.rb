Rails.application.routes.draw do

  resources :messages, only: [:index, :new, :create, :show]

  devise_for :users

  resources :conversations, only: [:index, :create, :show, :destroy]

  resources :welcome, only: [:index]

  root 'conversations#index'

end
