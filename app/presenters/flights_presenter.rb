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

  def save
    southwest_flight_ids.zip(southwest_delays).each do |r|
      Departure.create(flight_id: r[0], delays: r[1], airline_id: 1)
    end
  end
end
