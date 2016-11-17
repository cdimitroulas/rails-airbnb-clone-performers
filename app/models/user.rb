class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reviews
  has_many :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
end
