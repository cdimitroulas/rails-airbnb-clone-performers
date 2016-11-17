class Booking < ApplicationRecord
  belongs_to :performer, :user

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true

end
