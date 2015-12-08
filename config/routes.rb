Rails.application.routes.draw do
  resources :departments do
    collection { post :import }
  end
  resources :instruments do
    collection { post :import }
  end
  devise_for :users
  root to: 'instruments#index'
end
