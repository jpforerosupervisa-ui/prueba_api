class Authorization < ApplicationRecord
  self.primary_key = "authorization_id"
  belongs_to :person
  has_many :movements, foreign_key: "authorization_id"

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :person_id, presence: true

  def authorized_at?(time = Time.current)
  return false if start_time.blank? || end_time.blank?

  start_t = Time.parse(start_time)
  end_t   = Time.parse(end_time)

  time.between?(start_t, end_t)
  end

  self.record_timestamps = false
end
