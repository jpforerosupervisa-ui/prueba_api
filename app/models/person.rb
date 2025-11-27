class Person < ApplicationRecord
  self.primary_key = "person_id"
  has_many :authorizations

  validates :identification_number, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  self.record_timestamps = false
end
