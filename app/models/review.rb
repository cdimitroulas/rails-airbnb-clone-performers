class Review < ApplicationRecord
  belongs_to :user
  belongs_to :performer

  validates :title, presence: true
  validates :description, presence: true
end
