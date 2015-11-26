class DeparturesPresenter

  def total_flights
    to_json =
    {total_flights:
      {total: total_departures_all,
      on_time_departures: on_time_departures_all,
      late_departures: late_departures_all,
      }
    }
  end

  def total_departures_all
    Departure.total_departures
  end

  def on_time_departures_all
    Departure.total_on_time_flights
  end

  def late_departures_all
    Departure.total_late_flights
  end
end