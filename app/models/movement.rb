class Movement < ApplicationRecord
  self.primary_key = "movement_id"
  belongs_to :authorization, foreign_key: "authorization_id"


  validates :way, presence: true
  validates :authorization_id, presence: true

  self.record_timestamps = false
end
