require 'rails_helper'

RSpec.describe "Flight Stats API", type: :request do
  before(:each) do
    @airport_one   = Airport.create(name: "Denver International",
                                   code: "DEN")

    @airline_one   = Airline.create(name: "Southwest Airlines",
                                   code: "WN")

  end

  xit "returns all flights ids for an airline" do
    VCR.use_cassette("flights_api") do
      service = Flights.new('DEN', 'WN', :mt).flight_ids
      expect(service.first).to eq (629023960)
    end
  end

  xit "returns all gate delays for an airline" do
    VCR.use_cassette("flights_api") do
      service = Flights.new('DEN', 'WN', :mt).gate_delays
      expect(service.first).to eq ({:departureGateDelayMinutes=>72, :arrivalGateDelayMinutes=>130})
    end
  end

  xit "returns all flights numbers for an airline" do
    VCR.use_cassette("flights_api") do
      service = Flights.new('DEN', 'WN', :mt).flight_number
      expect(service.first).to eq ("501")
    end
  end

  xit "saves all the flights" do
    VCR.use_cassette("flights_api") do
      service = Flights.new('DEN', 'WN', :mt).save
      expect(service.first).to eq ([629023960, 72, "501"])
    end
  end
end
