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

  def sw_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(1)
  end

  def ua_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(2)
  end

  def frontier_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(3)
  end

  def delta_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(4)
  end

  def american_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(5)
  end

  def jetblue_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(6)
  end

  def spirit_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(7)
  end

  def virgin_on_time_percentage
    Airport.find(params[:id]).departures.total_on_time_percentage(8)
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
         # delay_index: delays,
         sw_on_time_percentage: sw_on_time_percentage,
         ua_on_time_percentage: ua_on_time_percentage,
         frontier_on_time_percentage: frontier_on_time_percentage,
         delta_on_time_percentage: delta_on_time_percentage,
         american_on_time_percentage: american_on_time_percentage,
         jetblue_on_time_percentage: jetblue_on_time_percentage,
         spirit_on_time_percentage: spirit_on_time_percentage,
         virgin_on_time_percentage: virgin_on_time_percentage,
        }
      }
    render json: to_json
  end
end
