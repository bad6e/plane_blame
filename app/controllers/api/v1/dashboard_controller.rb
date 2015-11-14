class Api::V1::DashboardController < ApplicationController
  respond_to :json

  def total_departures
    respond_with FlightsPresenter.new.total_departures(params[:id])
  end

  def late_departures
    respond_with FlightsPresenter.new.late_departures(params[:id])
  end

  def on_time_departures
    respond_with FlightsPresenter.new.on_time_departures(params[:id])
  end
end
