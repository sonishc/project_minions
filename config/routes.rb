Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users do
    resources :toys
  end
  # post "/toys", to: 'toys#update'
  root to: 'homes#index'
end
