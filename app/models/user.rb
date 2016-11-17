class User < ApplicationRecord
  has_many :reviews
  has_many :bookings
  has_many :messages_sent, class_name: "Message", as: :sender
  has_many :messages_received, class_name: "Message", as: :recipient

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

  mount_uploader :profile_picture, PhotoUploader
end
