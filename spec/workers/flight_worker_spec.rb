require 'rails_helper'

RSpec.describe "Flight Stats API Base", type: :request, vcr: true do
  before(:each) do
    @airport_one  = Airport.create(name: "Denver International",
                                   code: "DEN")

    @airline_one  = Airline.create(name: "Southwest Airlines",
                                   code: "WN")

  end
   it "returns correct request time for the east coast timezone" do
    Timecop.freeze(2015, 11, 18, hour=6) do
      service = FlightWorker.new('DEN', 'WN').api_offset_time(:ec)
      expect(service.first[1][:hourOfDay][:interpreted]).to eq (18)
    end
  end

   it "returns correct request time for the central timezone" do
    Timecop.freeze(2015, 11, 18, hour=6) do
      service = FlightWorker.new('DEN', 'WN').api_offset_time(:cc)
      expect(service.first[1][:hourOfDay][:interpreted]).to eq (17)
    end
  end

   it "returns correct request time for the mountain timezone" do
    Timecop.freeze(2015, 11, 18, hour=6) do
      service = FlightWorker.new('DEN', 'WN').api_offset_time(:mt)
      expect(service.first[1][:hourOfDay][:interpreted]).to eq (16)
    end
  end

  it "returns correct request time for the pacific timezone" do
    Timecop.freeze(2015, 11, 18, hour=6) do
      service = FlightWorker.new('DEN', 'WN').api_offset_time(:pc)
      expect(service.first[1][:hourOfDay][:interpreted]).to eq (15)
    end
  end
end
