require 'rails_helper'

RSpec.describe "Flight Stats API", type: :request do

  it "returns the api call by a user" do
    VCR.use_cassette("flights_api") do
      service = FlightWorker.new('DEN', 'WN').api_offset_time(:mt)
    end
  end
end
