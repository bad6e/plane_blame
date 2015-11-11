class Departure < ActiveRecord::Base
  belongs_to :airline
  validates :flight_id, presence: true, uniqueness: true

  def self.total_departures
    Rails.cache.fetch('total', expires_in: 1.hour) do
      count
    end
  end

  def self.total_late_flights
    Rails.cache.fetch('total_late_flights', expires_in: 1.hour) do
      Departure.where(["dep_gate_delays > ?", 15]).count
    end
  end

  def self.total_on_time_flights
    Rails.cache.fetch('total_on_time_flights', expires_in: 1.hour) do
      Departure.where(["dep_gate_delays < ?", 15]).count
    end
  end


end
