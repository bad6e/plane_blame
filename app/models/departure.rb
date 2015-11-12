class Departure < ActiveRecord::Base
  belongs_to :airline
  belongs_to :airport
  validates :flight_id, presence: true, uniqueness: true

  def self.total_departures
    count
  end

  def self.total_late_flights
    where(["dep_gate_delays > ?", 15]).count
  end

  def self.total_on_time_flights
    where(["dep_gate_delays < ?", 15]).count
  end

  def self.total_on_time_number(airline_id)
    where("dep_gate_delays < ? AND airline_id = ?", 15, airline_id).count
  end

  def self.total_flights_per_airline(airline_id)
    where("airline_id = ?", airline_id).count
  end

  def self.total_on_time_percentage(airline_id)
    ((total_on_time_number(airline_id).to_f)/(total_flights_per_airline(airline_id).to_f)) * 100
  end

  def self.last_updated_at
    last.created_at.in_time_zone('America/Denver').strftime("%A, %B %d, %Y at %I:%M%p")
  end
end
