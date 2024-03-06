Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  devise_for :parents
  resources :pods
  resources :teachers
  resources :children
  resources :applications, only: [:new, :create]
  resources :pods do
    resources :reviews
  end
end
