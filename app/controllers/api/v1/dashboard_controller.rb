class Api::V1::DashboardController < ApplicationController
  respond_to :json

  def airport_name
    respond_with FlightsPresenter.new.airport_name(params[:id])
  end

  def total_departures
    respond_with FlightsPresenter.new.total_departures_per_airport(params[:id])
  end

  def on_time_departures
    respond_with FlightsPresenter.new.total_on_time_departures_per_airport(params[:id])
  end

  def late_departures
    respond_with FlightsPresenter.new.totaL_late_departures_per_airport(params[:id])
  end
end
