class FlightsPresenter

  def airport_name(airport_id=1)
    Airport.find(airport_id).name
  end

  def total_departures(airport_id=1)
    Airport.find(airport_id).departures.count
  end

  def late_departures(airport_id=1)
    Airport.find(airport_id).departures.where(["dep_gate_delays > ?", 15]).count
  end

  def on_time_departures(airport_id=1)
    Airport.find(airport_id).departures.where(["dep_gate_delays < ?", 15]).count
  end



  def total_late_departures
    Departure.total_late_flights
  end

  def total_on_time_departures
    Departure.total_on_time_flights
  end

  def airline_on_time_percentage(airline_id)
    Departure.total_on_time_percentage(airline_id)
  end

  def last_updated_at
    Departure.last_updated_at
  end

  def total_number_of_flights(airline_id)
    Departure.total_flights_per_airline(airline_id)
  end
end
