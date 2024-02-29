Rails.application.routes.draw do
  root 'home#index'
  devise_for :parents
  resources :pods, only: [:index, :new, :create]
  resources :teachers, only: [:new, :create]
end
