Rails.application.routes.draw do
  root 'home#index'
  devise_for :parents
  resources :pods, only: [:index, :new, :create]
  resources :teachers, only: [:new, :create]
  resources :children, only: [:new, :create]
  resources :applications, only: [:new, :create]
end
