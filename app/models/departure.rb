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
      Departure.where(["dep_gate_delays > ?", 20]).sum
    end
  end

  def self.total_on_time_flights
    Rails.cache.fetch('total_on_time_flights', expires_in: 1.hour) do
      Departure.where(["dep_gate_delays < ?", 20]).sum
    end
  end

  def self.total_late_number(airline_id)
    Departure.where("dep_gate_delays > ? AND airline_id = ?", 20, airline_id).count
  end

  def self.total_late_percentage(airline_id)
    ((total_late_number(airline_id).to_f)/(total_departures.to_f) * 100)
  end
end
