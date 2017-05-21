Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root "home#index"

  namespace :admin do
    root to: "dashboards#index", as: 'root'
    resources :users  do
      resources :appointments
    end
  end
  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index]
      resources :users, only: [:show]  do
        resources :appointments, only: [:show]
      end
    end
  end
end
