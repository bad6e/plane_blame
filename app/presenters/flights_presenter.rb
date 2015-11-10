class FlightsPresenter
  attr_reader :user, :worker

  def initialize
    @worker = DenverSouthwestWorker.new.southwest_flights_from_denver
  end

  def southwest_flight_ids
    flight_ids = worker[:flightStatuses].map {|r| r[:flightId]}
  end

  def southwest_delays
    delays = worker[:flightStatuses].map {|r| r[:delays]}
  end

  def flight_number
    flight_number = worker[:flightStatuses].map {|r| r[:flightNumber]}
  end

  def join
    southwest_flight_ids.zip(southwest_delays)
  end

  def flatten
    join.zip(flight_number).map {|r| r.flatten}
  end

  def save
    flatten.each do |r|
      Departure.create(flight_id: r[0], delays: r[1], flight_number: r[2], airline_id: 1)
    end
  end
end
