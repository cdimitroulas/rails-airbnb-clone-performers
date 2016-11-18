class Performer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :messages_sent, class_name: "Message", as: :sender
  has_many :messages_received, class_name: "Message", as: :recipient


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

  def self.search_filter(params)
    results = with_location.within_fifty(params[:postcode])
    results = results.with_category(params[:category])
    results = results.with_event_types(params[:event_types])

    results
  end

  def self.with_location
    where.not(latitude: nil, longitude: nil)
  end

  def self.within_fifty(postcode)
    postcode.present? ? near(postcode, 50) : all
  end

  def self.with_category(category)
    category.present? ? where(category: category) : all
  end

  def self.with_event_types(event_types_search)
    if event_types_search.present?
      results = []
      all.map do |performer|
        results << performer if performer.event_types.include?(event_types_search)
      end
      return results
    else
      return all
    end
  end
end
