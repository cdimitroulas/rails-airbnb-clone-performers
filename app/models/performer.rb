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
    results = results.with_hourly_rate([params[:min_price], params[:max_price]])
    #results = results.with_availability(params[:date])
    results = results.with_event_types(params[:event_types])
    return results
    # if params[:event_types].present?
    #   self.no_bookings.each { |result| results << result}
    #   results.map{ |i| i.id }
    #   return where(id: results)
    # else
    #   return results
    # end
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

  def self.with_availability(date)
    if date.present?

      all.joins(:bookings).where.not(bookings: { start_time: date.to_date })

      # binding.pry
      # results = all.joins(:bookings).where.not(bookings: { start_time: date.to_date })
      # binding.pry
      # results.or(results_no_bookings)
      # do |performer|
      #  if performer.bookings.present?
      #    performer.bookings.each do |booking|
      #      results << performer unless booking.start_time.to_date == date.to_date
      #    end
      #  else
      #    results << performer
      #  end
      # end
    else
      return all
    end
  end

  def self.no_bookings
    all.includes(:bookings).where( bookings: { performer_id: nil })
  end

  def self.with_hourly_rate(hourly_rate_search)
    hourly_rate_search.blank? ? where(hourly_rate: hourly_rate_search[0].to_i..hourly_rate_search[1].to_i) : all
  end
end
