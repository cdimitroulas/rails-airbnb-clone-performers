class Message < ApplicationRecord
  belongs_to :booking

  validates :subject, presence: true
  validates :content, presence: true
end
