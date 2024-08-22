Rails.application.routes.draw do
    devise_for :users
    health_check_routes

    root "rooms#index"

    resources :rooms, only: %i[index show new create] do
      collection do
        get 'search'
      end
    end

    resources :bookings, only: [:new, :create]

    # Routes pour afficher les chambres et réservations de l'utilisateur
    get 'my_rooms', to: 'rooms#my_rooms', as: :my_rooms
    get 'my_reservations', to: 'bookings#my_reservations', as: :my_reservations
  end
