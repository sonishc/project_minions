Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users do
    resources :toys
  end
  post "/send_history", to: 'toys#send_history'
  root to: 'homes#index'
end
