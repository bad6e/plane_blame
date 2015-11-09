class Airline < ActiveRecord::Base
  has_many :departures
end
