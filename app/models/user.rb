class User < ApplicationRecord
  has_many :events
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances

  validates :name, presence: true, uniqueness: true

  def attend(event)
    attended_events << event
  end
end
