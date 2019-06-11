Rails.application.routes.draw do
  get 'messages/create'
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/test', to: 'pages#test'

  resources :bookings, only: [ :index, :new, :create ]
  get 'dashboard_client', to: 'bookings#dashboard_client', as: 'dashboard_client'
  resources :coaches, only: [ :index, :show ]
  resources :coaches do
    get 'book', to: 'coaches#see_slots', as: 'slots'
    get 'book/:booking_id', to: 'coaches#book', as: 'book'
    patch 'book/:booking_id', to: 'coaches#edit_booking'
  end
  resources :bookings do
    resources :reviews, only: [:new, :create]
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :bookings, only: [ :index, :show, :destroy ]
      resources :coaches, only: [ :index ] do
        resources :availabilities, only: [:index]
      end
    end
  end
  resources :chat_rooms, only: :show do
    resources :messages, only: [ :create ]
  end
  # get 'messages', to: 'chat_rooms#index', as: 'messages'
  mount ActionCable.server => "/cable"

end
