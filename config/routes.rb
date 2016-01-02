Rails.application.routes.draw do
  get 'departments/autocomplete',   to: 'departments#autocomplete'
  resources :departments do
    collection do
      post :import
    end
  end

  get 'manufacturers/autocomplete', to: 'manufacturers#autocomplete'
  get 'models/autocomplete',        to: 'models#autocomplete'
  resources :instruments do
    collection { post :import }
  end
  devise_for :users
  root to: 'instruments#index'
end
