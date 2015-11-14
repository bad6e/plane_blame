class Api::V1::AutoCompleteController < ApplicationController
  respond_to :json

  def search
    if params[:term]
      @airport = Airport.where('name LIKE ?', "%#{params[:term]}%")
    else
      @airport = Airport.all
    end

    respond_to do |format|
      format.json { render :json => @airport.to_json }
    end
  end
end