Rails.application.routes.draw do
  resources :instruments
  devise_for :users
  root to: 'instruments#index'
end
