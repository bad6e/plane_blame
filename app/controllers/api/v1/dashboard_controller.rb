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
         delay_index: delays
        }
      }
    render json: to_json
  end
end
