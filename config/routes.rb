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
  scope module: 'admin' do
    get 'admin', to: 'dashboard#index', as: '/dashboard'
  end
  root to: 'homes#index'
end
