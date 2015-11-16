require 'rails_helper'

RSpec.describe "Flight Stats API", type: :request do
  before(:each) do
    @airport_one   = Airport.create(name: "Denver International",
                                   code: "DEN")

    @airline_one   = Airline.create(name: "Southwest Airlines",
                                   code: "WN")

  end

  it "returns all flights ids for an airline" do
    VCR.use_cassette("flights_api") do
      service = Flights.new('DEN', 'WN', :mt).flight_ids
      expect(service.first).to eq (629023971)
    end
  end

  it "returns all gate delays for an airline" do
    VCR.use_cassette("flights_api") do
      service = Flights.new('DEN', 'WN', :mt).gate_delays
      expect(service.first).to eq ({:departureGateDelayMinutes=>3})
    end
  end

  it "returns all flights numbers for an airline" do
    VCR.use_cassette("flights_api") do
      service = Flights.new('DEN', 'WN', :mt).flight_number
      expect(service.first).to eq ("260")
    end
  end

  it "saves all the flights" do
    VCR.use_cassette("flights_api") do
      service = Flights.new('DEN', 'WN', :mt).save
      expect(service.first).to eq ([629023971, 3, "260"])
    end
  end
end
