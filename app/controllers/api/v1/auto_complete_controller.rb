class Api::V1::AutoCompleteController < ApplicationController
  respond_to :json

  def search
    if params[:term]
      @airport = Airport.order(:name).where('name LIKE ?', "%#{params[:term].downcase}%" )
    else
      @airport = Airport.all
    end
    render json: @airport.to_json
  end
end