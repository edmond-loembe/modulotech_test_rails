# TODO: Add features to this model to implement the other TODO.
class Room < ApplicationRecord

  # Associations, validations, etc.

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :images, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_night, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def available?(start_date, end_date)
    # Logique pour vérifier si la chambre est disponible entre ces dates
    bookings.where('start_date < ? AND end_date > ?', end_date, start_date).empty?
  end

end
