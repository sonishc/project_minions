Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: :show do
    resources :toys
    member do
      get '/confirm_email', to: 'users#confirm_email'
    end
  end
  post '/event_switch', to: 'toys#event_switch'
  post '/send_history', to: 'toys#send_history'
  root to: 'homes#index'
end
