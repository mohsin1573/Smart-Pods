Rails.application.routes.draw do
  root 'home#index'
  devise_for :parents
  resources :pods, only: [:index, :new, :create]
end
