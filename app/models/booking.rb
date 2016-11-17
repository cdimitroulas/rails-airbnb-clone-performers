class Booking < ApplicationRecord
  belongs_to :performer
  belongs_to :user

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true

end
