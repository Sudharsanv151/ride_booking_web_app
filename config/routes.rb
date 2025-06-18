Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users do
    resources :bookings, only: [:index, :create]
    resources :ratings, only: [:index, :create]
    resources :rewards, only: [:index]
  end

  resources :vehicles do
    resources :bookings, only: [:index, :create]
    resources :ratings, only: [:index, :create]
    resources :tags, only: [:index]
  end

  resources :bookings do
    resources :payments, only: [:index, :create]
    resources :ratings, only: [:index, :create]
  end

  resources :payments
  resources :rewards
  resources :ratings
  resources :tags
  resources :customers
  resources :drivers

  root "users#index"
end
