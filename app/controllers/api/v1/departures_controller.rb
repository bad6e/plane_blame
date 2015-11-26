class Api::V1::DeparturesController < ApplicationController
  respond_to :json

  def index
    departures_info = DeparturesPresenter.new.total_flights
    render json: departures_info
  end
end
