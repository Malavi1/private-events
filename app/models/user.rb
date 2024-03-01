class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id',  dependent: :destroy
  has_many :even_attendees, foreign_key: 'attendee_id'
  has_many :attended_events, through: :even_attendees, source: :event
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
