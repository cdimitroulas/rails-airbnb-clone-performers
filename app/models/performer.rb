class Performer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reviews
  has_many :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true

  geocoded_by :full_address

  def full_address
    self.city + ", " + self.postcode
  end

  after_validation :geocode, if: :postcode_changed?

  mount_uploader :profile_picture, PhotoUploader
  mount_uploader :picture, BannerPhotoUploader
end
