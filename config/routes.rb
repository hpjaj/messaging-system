Rails.application.routes.draw do

  resources :messages, only: [:index, :new, :create, :show]

  devise_for :users

  resources :conversations, only: [:index, :create, :show, :destroy]

  get 'welcome' => 'welcome#index'

  root 'welcome#index'

end
