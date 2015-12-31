Rails.application.routes.draw do
  resources :departments do
    collection do
      get  :autocomplete
      post :import
    end
  end
  resources :instruments do
    collection { post :import }
  end
  devise_for :users
  root to: 'instruments#index'
end
