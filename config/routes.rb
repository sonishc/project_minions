Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: :show do
    resources :toys do
      member do
        get '/event_switch', to: 'toys#event_switch'
        post '/send_history', to: 'toys#send_history'
      end
    end
    member do
      get '/confirm_email', to: 'users#confirm_email'
    end
  end
  namespace 'admin' do
    resources :dashboard
    resources :users
    resources :toys
  end
  root to: 'homes#index'
end
