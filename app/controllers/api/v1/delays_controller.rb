class Api::V1::DelaysController < ApplicationController
  respond_to :json

  def delays
    respond_with DelayIndexService.new(find_airport_code(params[:id])).normalized_score
  end

  def find_airport_code(airport_id)
    Airport.find(airport_id).code
  end
end
