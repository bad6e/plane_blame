class FlightsPresenter
  def total_departures
    Departure.total_departures
  end

  def total_late_departures
    Departure.total_late_flights
  end

  def total_on_time_departures
    Departure.total_on_time_flights
  end
end