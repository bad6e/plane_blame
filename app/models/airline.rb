class Airline < ActiveRecord::Base
  has_many :departures
  validates :name, presence: true, uniqueness: true
end
