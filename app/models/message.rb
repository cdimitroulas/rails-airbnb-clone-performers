class Message < ApplicationRecord
  belongs_to :user
  belongs_to :performer

  validates :subject, presence: true
  validates :content, presence: true
end
