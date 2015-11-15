class Api::V1::DashboardController < ApplicationController
  respond_to :json

  def airport_name
    FlightsPresenter.new.airport_name(params[:id])
  end

  def total_departures
    FlightsPresenter.new.total_departures_per_airport(params[:id])
  end

  def on_time_departures
    FlightsPresenter.new.total_on_time_departures_per_airport(params[:id])
  end

  def late_departures
    FlightsPresenter.new.total_late_departures_per_airport(params[:id])
  end

  def delays
    DelayIndexService.new(find_airport_code(params[:id])).normalized_score
  end

  def airline_ids
    [1,2,3,4,5,6,7,8]
  end

  def on_time_percentage
    airline_ids.map {|r| Airport.find(params[:id]).departures.total_on_time_percentage(r)}
  end

  def number_of_flights
    airline_ids.map {|r| Airport.find(params[:id]).departures.total_flights_per_airline(r)}
  end

  def airline_name
    airline_ids.map{|r| Airline.find(r).name}
  end


  def sw_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(1)
  end

  def sw_number_flights
    Airport.find(params[:id]).departures.total_flights_per_airline(1)
  end

  def ua_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(2)
  end

  def ua_number_flights
    Airport.find(params[:id]).departures.total_flights_per_airline(2)
  end


  def frontier_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(3)
  end

  def frontier_number_flights
    Airport.find(params[:id]).departures.total_flights_per_airline(3)
  end


  def delta_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(4)
  end

  def delta_number_flights
    Airport.find(params[:id]).departures.total_flights_per_airline(4)
  end


  def american_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(5)
  end

  def american_number_flights
    Airport.find(params[:id]).departures.total_flights_per_airline(5)
  end



  def jetblue_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(6)
  end

  def jetblue_number_flights
    Airport.find(params[:id]).departures.total_flights_per_airline(6)
  end


  def spirit_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(7)
  end

  def spirit_number_flights
    Airport.find(params[:id]).departures.total_flights_per_airline(7)
  end


  def virgin_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(8)
  end

  def virgin_number_flights
    Airport.find(params[:id]).departures.total_flights_per_airline(8)
  end

  def last_update
    Airport.find(params[:id]).departures.last_updated_at
  end


  def find_airport_code(airport_id)
    Airport.find(airport_id).code
  end

  def total
     to_json =
      {airport_name:
        {name: airport_name,
         total_departures: total_departures,
         on_time_departures: on_time_departures,
         late_departures: late_departures,
         last_updated: last_update,
         on_time_percentage: on_time_percentage,
         number_of_flights: number_of_flights,
         airline_name: airline_name,
         # delay_index: delays,

         sw_on_time_percentage: sw_on_time_percentage,
         sw_number_flights: sw_number_flights,

         ua_on_time_percentage: ua_on_time_percentage,
         ua_number_flights: ua_number_flights,

         frontier_on_time_percentage: frontier_on_time_percentage,
         frontier_number_flights: frontier_number_flights,

         delta_on_time_percentage: delta_on_time_percentage,
         delta_number_flights: delta_number_flights,

         american_on_time_percentage: american_on_time_percentage,
         american_number_flights: american_number_flights,

         jetblue_on_time_percentage: jetblue_on_time_percentage,
         jetblue_number_flights: jetblue_number_flights,

         spirit_on_time_percentage: spirit_on_time_percentage,
         spirit_number_flights: spirit_number_flights,

         virgin_on_time_percentage: virgin_on_time_percentage,
         virgin_number_flights: virgin_number_flights,
        }
      }
    render json: to_json
  end
end
