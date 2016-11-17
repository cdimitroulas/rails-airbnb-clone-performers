class Message < ApplicationRecord
  belongs_to :sender, polymorphic: true
  belongs_to :recipient, polymorphic: true

  validates :subject, presence: true
  validates :content, presence: true
end
