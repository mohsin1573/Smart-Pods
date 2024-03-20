Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  devise_for :parents
  resources :pods, :teachers, :children, :applications
  resources :pods do
    resources :reviews, only: [:create]
  end
end
