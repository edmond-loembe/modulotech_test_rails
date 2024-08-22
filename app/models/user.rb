class User < ApplicationRecord

  # Associez les utilisateurs aux réservations
  has_many :bookings, dependent: :destroy

  has_many :rooms, dependent: :destroy

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
