class Performer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reviews
  has_many :bookings
  has_many :messages


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

  geocoded_by :full_address

  def full_address
    self.city + ", " + self.postcode
  end

  after_validation :geocode, if: :postcode_changed?
  # scope :category, -> (category) { where category: category }
  # # scope :city, -> (city) { where city: city }
  # scope :location, -> (location_id) { where location_id: location_id }
  # scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
end
