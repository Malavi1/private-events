class Event < ApplicationRecord
    validates :place, :time, presence:true
    belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
    has_many :even_attendees, dependent: :destroy    
    has_many :attendees, through: :even_attendees, source: :attendee
    scope :today, -> { where("DATE(events.created_at) = ?", Date.today) }
    scope :past, -> { where("DATE(events.created_at) < ?", Date.today) }
    scope :future, -> { where("DATE(events.created_at) > ?", Date.today) }
end
