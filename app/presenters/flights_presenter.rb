class FlightsPresenter
  attr_reader :user, :worker

  def initialize
    @worker = DenverSouthwestWorker.new.southwest_flights_from_denver
  end

  def southwest_flight_ids
    flight_ids = worker[:flightStatuses].map {|r| r[:flightId]}
  end

  # def southwest_delays
  #   delays = worker[:flightStatuses].map {|r| r[:delays]}
  # end

  def gate_delays
    remove_nil(worker[:flightStatuses].map {|r| r[:delays]})
  end

  def gate_departure_delay
    delays = gate_delays.map do |r|
      r.class == Hash ? r[:departureGateDelayMinutes] : r
    end
    remove_nil(delays)
  end

  def remove_nil(array)
    array.map do |r|
      r.nil? ? r = 0 : r
    end
  end

  def flight_number
    flight_number = worker[:flightStatuses].map {|r| r[:flightNumber]}
  end

  def join
    southwest_flight_ids.zip(gate_departure_delay)
  end

  def flatten
    join.zip(flight_number).map {|r| r.flatten}
  end

  def save
    flatten.each do |r|
      Departure.create(flight_id: r[0], dep_gate_delays: r[1], flight_number: r[2], airline_id: 1)
    end
  end
end
