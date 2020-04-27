 class Event < ApplicationRecord
   has_many :attendances, foreign_key: :attended_event_id
   has_many :attendees, through: :attendances
   belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

   validates :desc, presence: true

   scope :past, ->(current_time = DateTime.now) { where('date < ?', current_time) }
   scope :upcoming, ->(current_time = DateTime.now) { where('date >= ?', current_time) }
end
