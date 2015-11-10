class Departure < ActiveRecord::Base
  belongs_to :airline
  validates :flight_id, presence: true, uniqueness: true
end
