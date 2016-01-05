Rails.application.routes.draw do
  resources :companies do
    collection do
      post :import
    end
  end

  get 'departments/autocomplete',   to: 'departments#autocomplete'
  resources :departments do
    collection do
      post :import
    end
  end

  get 'brands/autocomplete', to: 'brands#autocomplete'
  get 'models/autocomplete', to: 'models#autocomplete'
  resources :instruments do
    collection { post :import }
  end
  devise_for :users
  root to: 'instruments#index'
end
