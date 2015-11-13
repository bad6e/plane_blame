class Api::V1::DelaysController < ApplicationController
  respond_to :json

  def index
    respond_with DelayIndexService.new.normalized_score
  end

  def autocomplete
    if params[:term]
      @airport = Airport.where('name LIKE ?', "%#{params[:term]}%")
    else
      @airport = Airport.all
    end

    respond_to do |format|
      format.html
      format.json { render :json => @airport.to_json }
    end
  end
end
