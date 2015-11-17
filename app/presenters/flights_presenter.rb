class FlightsPresenter
  def total_departures
    Departure.total_departures
  end

  def total_on_time_departures
    Departure.total_on_time_flights
  end

  def total_late_departures
    Departure.total_late_flights
  end

  def last_updated_at
    Departure.last_updated_at
  end

  def airline_names
    airline_ids.map {|r| Airline.find(r).name}
  end

  def total_percentage
    airline_ids.map {|r| Departure.total_on_time_percentage(r)}
  end

  def total_percentage_and_name
    total_percentage.zip(airline_names).sort { |x,y| y <=> x }
  end

  def airline_ids
    Airline.pluck(:id)
  end
end
