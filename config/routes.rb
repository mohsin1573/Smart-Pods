Rails.application.routes.draw do
  root 'home#index'
  devise_for :parents
  resources :pods
  resources :teachers
  resources :children, only: [:new, :create]
  resources :applications, only: [:new, :create]
  resources :pods do
    resources :reviews, only: [:new, :create]
  end
end
