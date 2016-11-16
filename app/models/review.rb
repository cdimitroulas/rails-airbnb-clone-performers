class Review < ApplicationRecord
  belongs_to :user
  belongs_to :performer

  validates :rating, presence: true, inclusion: { in: 0..5 }
  validates :title, presence: true
  validates :description, presence: true
end
