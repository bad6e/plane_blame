class Departure < ActiveRecord::Base
  belongs_to :airline
  validates :flight_id, presence: true, uniqueness: true

  def self.total_departures
    count
  end

  def self.total_late_flights
    where(["dep_gate_delays > ?", 20]).count
  end

  def self.total_on_time_flights
    where(["dep_gate_delays < ?", 20]).count
  end

  def self.total_on_time_number(airline_id)
    where("dep_gate_delays < ? AND airline_id = ?", 20, airline_id).count
  end

  def self.total_flights_per_airline(airline_id)
    where("airline_id = ?", airline_id).count
  end

  def self.total_late_percentage(airline_id)
    ((total_on_time_number(airline_id).to_f)/(total_flights_per_airline(airline_id).to_f)) * 100
  end
end
