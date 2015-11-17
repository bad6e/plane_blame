require 'rails_helper'

RSpec.describe "Flight Stats API", type: :request, vcr: true do
  before(:each) do
    @airport_one   = Airport.create(name: "Denver International",
                                   code: "DEN")

    @airline_one   = Airline.create(name: "Southwest Airlines",
                                   code: "WN")

  end

  it "returns all flights ids for an airline" do
    Timecop.freeze(2015, 11, 17, hour=6) do
      service = Flights.new('DEN', 'WN', :mt).flight_ids
      expect(service.first).to eq (629023960)
    end
  end

  it "returns all gate delays for an airline" do
    Timecop.freeze(2015, 11, 17, hour=6) do
      service = Flights.new('DEN', 'WN', :mt).gate_delays
      expect(service.first).to eq ({:departureGateDelayMinutes=>72, :arrivalGateDelayMinutes=>115})
    end
  end

  it "returns all flights numbers for an airline" do
    Timecop.freeze(2015, 11, 17, hour=6) do
      service = Flights.new('DEN', 'WN', :mt).flight_number
      expect(service.first).to eq ("501")
    end
  end

  it "saves all the flights" do
    Timecop.freeze(2015, 11, 17, hour=6) do
      service = Flights.new('DEN', 'WN', :mt).save
      expect(service.first).to eq ([629023960, 72, "501"])
    end
  end
end
