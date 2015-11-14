class Api::V1::DelaysController < ApplicationController
  respond_to :json

  def index
    respond_with DelayIndexService.new.normalized_score
  end
end
