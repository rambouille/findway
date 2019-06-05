Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/test', to: 'pages#test'
  resources :bookings, only: :index
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :bookings, only: [ :index ]
    end
  end
end
