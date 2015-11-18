class Api::V1::DashboardController < ApplicationController
  respond_to :json

  def airport_name
    Airport.find(airport_id).name
  end

  def total_departures
    Airport.find(airport_id).departures.count
  end

  def on_time_departures
    Airport.find(airport_id).departures.where(["dep_gate_delays <= ?", 15]).count
  end

  def late_departures
    Airport.find(airport_id).departures.where(["dep_gate_delays > ?", 15]).count
  end

  def on_time_percentage
    airline_ids.map {|r| Airport.find(airport_id).departures.total_on_time_percentage(r)}
  end

  def number_of_flights
    airline_ids.map {|r| Airport.find(airport_id).departures.total_flights_per_airline(r)}
  end

  def delays
    DelayIndexService.new(find_airport_code(airport_id)).normalized_score
  end

  def airline_ids
    Airline.pluck(:id)
  end

  def airline_names
    Airline.pluck(:name)
  end

  def last_update
    Airport.find(airport_id).departures.last_updated_at
  end

  def total
    sleep(1.5)
     to_json =
      {airport_name:
        {name: airport_name,
         total_departures: total_departures,
         on_time_departures: on_time_departures,
         late_departures: late_departures,
         last_updated: last_update,
         on_time_percentage: on_time_percentage,
         number_of_flights: number_of_flights,
         airline_names: airline_names,
         # delay_index: delays,
        }
      }
    render json: to_json
  end

  private

  def airport_id
    params[:id]
  end

  def find_airport_code(airport_id)
    Airport.find(airport_id).code
  end
end
