class Api::V1::AirportsController < ApplicationController
  respond_to :json

  def show
    airport_info = AirportsPresenter.new(params[:id]).total
    render json: airport_info
  end
end