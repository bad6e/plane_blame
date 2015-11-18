require 'rails_helper'

RSpec.describe Api::V1::DashboardController, type: :controller, vcr: true do
  before(:each) do
    @airport_one   = Airport.create(name: "Denver International",
                                     code: "DEN")

    @airport_two   = Airport.create(name: "Ronald Reagan National Airport",
                                     code: "DIA")

    @airline_one   = Airline.create(name: "Southwest Airlines",
                                     code: "WN")

    @airline_two   = Airline.create(name: "Frontier Airlines",
                                     code: "F9")

    Timecop.freeze(2015, 11, 17, hour=6) do
      @departure_one = Departure.create(dep_gate_delays: 10 ,
                      airline_id: @airline_one.id,
                      airport_id: @airport_one.id,
                      flight_id: 1111,
                      flight_number: '1234')
    end

    Timecop.freeze(2015, 11, 17, hour=6) do
      @departure_two = Departure.create(dep_gate_delays: 16 ,
                      airline_id: @airline_one.id,
                      airport_id: @airport_one.id,
                      flight_id: 1112,
                      flight_number: '1235')
    end

    Timecop.freeze(2015, 11, 17, hour=6) do
      @departure_three = Departure.create(dep_gate_delays: 1 ,
                      airline_id: @airline_two.id,
                      airport_id: @airport_one.id,
                      flight_id: 1113,
                      flight_number: '1238')
    end

    Timecop.freeze(2015, 11, 17, hour=6) do
      @departure_four = Departure.create(dep_gate_delays: 16 ,
                      airline_id: @airline_one.id,
                      airport_id: @airport_two.id,
                      flight_id: 1115,
                      flight_number: '1236')
    end

    Timecop.freeze(2015, 11, 17, hour=6) do
      @departure_five = Departure.create(dep_gate_delays: 1 ,
                      airline_id: @airline_one.id,
                      airport_id: @airport_two.id,
                      flight_id: 1116,
                      flight_number: '1238')
    end
  end

  describe "GET /api/v1/total/:id" do

    it "gets the airport name" do
      Timecop.freeze(2015, 11, 17, hour=6) do
        get :total, format: :json, id: @airport_one.id
        expect(response_data['airport_name']['name']).to eq(@airport_one.name)
      end
    end

    it "gets the total departures per airport" do
      Timecop.freeze(2015, 11, 17, hour=6) do
        get :total, format: :json, id: @airport_one.id
        expect(response_data['airport_name']['total_departures']).to eq(3)
      end
    end

    it "gets the total on-time departures per airport" do
      Timecop.freeze(2015, 11, 17, hour=6) do
        get :total, format: :json, id: @airport_one.id
        expect(response_data['airport_name']['on_time_departures']).to eq(2)
      end
    end

    it "gets total late departures per airport" do
      Timecop.freeze(2015, 11, 17, hour=6) do
        get :total, format: :json, id: @airport_one.id
        expect(response_data['airport_name']['late_departures']).to eq(1)
      end
    end

    it "gets the last updated departure created at time" do
      Timecop.freeze(2015, 11, 17, hour=6) do
        get :total, format: :json, id: @airport_one.id
        expect(response_data['airport_name']['last_updated']).to eq("Monday, November 16, 2015 at 11:00PM")
      end
    end

    it "gets the last on_time_percentage per airline at one airport as an array" do
      Timecop.freeze(2015, 11, 17, hour=6) do
        get :total, format: :json, id: @airport_one.id
        expect(response_data['airport_name']['on_time_percentage']).to eq([50.0, 100])
      end
    end

    it "gets the number of flights per airline at one airport as an array" do
      Timecop.freeze(2015, 11, 17, hour=6) do
        get :total, format: :json, id: @airport_one.id
        expect(response_data['airport_name']['number_of_flights']).to eq([2, 1])
      end
    end

    it "gets the name of each airline that flies into one airport as an array" do
      Timecop.freeze(2015, 11, 17, hour=6) do
        get :total, format: :json, id: @airport_one.id
        expect(response_data['airport_name']['airline_names']).to eq(['Southwest Airlines','Frontier Airlines'])
      end
    end
  end

  describe "GET /api/v1/all" do

    it "get the total number of departures across all airlines" do
      Timecop.freeze(2015, 11, 17, hour=6) do
        get :total_flights, format: :json
        expect(response_data['total_flights']['total']).to eq(5)
      end
    end

    it "get the total number of on-time departures across all airlines" do
      Timecop.freeze(2015, 11, 17, hour=6) do
        get :total_flights, format: :json
        expect(response_data['total_flights']['on_time_departures']).to eq(3)
      end
    end

    it "get the total number of late departures across all airlines" do
      Timecop.freeze(2015, 11, 17, hour=6) do
        get :total_flights, format: :json
        expect(response_data['total_flights']['late_departures']).to eq(2)
      end
    end
  end
end
