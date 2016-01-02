Rails.application.routes.draw do
  resources :departments do
    collection do
      post :import
    end
  end

  get 'departments/autocomplete',   to: 'departments#autocomplete'
  get 'manufacturers/autocomplete', to: 'manufacturers#autocomplete'

  resources :instruments do
    collection { post :import }
  end
  devise_for :users
  root to: 'instruments#index'
end
