Rails.application.routes.draw do
  root 'home#index'

  resources :todos, only: [:index, :create, :destroy]
end
