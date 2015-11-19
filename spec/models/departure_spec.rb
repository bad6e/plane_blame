require 'rails_helper'

RSpec.describe Departure, type: :model do
  before(:each) do
    @airport_one   = Airport.create(name: "Denver International",
                                   code: "DEN")

    @airline_one   = Airline.create(name: "Southwest Airlines",
                                   code: "WN")

    @departure_one  = Departure.create(dep_gate_delays: 10 ,
                    airline_id: @airline_one.id,
                    airport_id: @airport_one.id,
                    flight_id: 1111,
                    flight_number: '1234',
                    created_at: Timecop.freeze(2015, 11, 18, hour=1, minute=0, second=0))

    @departure_two  = Departure.create(dep_gate_delays: 16 ,
                    airline_id: @airline_one.id,
                    airport_id: @airport_one.id,
                    flight_id: 1112,
                    flight_number: '1235',
                    created_at: Timecop.freeze(2015, 11, 18, hour=1, minute=0, second=0))

    @departure_three = Departure.create(dep_gate_delays: 10 ,
                    airline_id: @airline_one.id,
                    airport_id: @airport_one.id,
                    flight_id: 1114,
                    flight_number: '1237',
                    created_at: Timecop.freeze(2015, 11, 19, hour=1, minute=0, second=0))

    @departure_four = Departure.create(dep_gate_delays: 16 ,
                    airline_id: @airline_one.id,
                    airport_id: @airport_one.id,
                    flight_id: 1113,
                    flight_number: '1236',
                    created_at: Timecop.freeze(2015, 11, 20, hour=1, minute=0, second=0))



  end

  it "is valid" do
    expect(@departure_one).to be_valid
  end

  it "is invalid without a name" do
    @departure_one.flight_id = nil
    expect(@departure_one).to be_invalid
  end

  it "returns the number of departures" do
    expect(Departure.total_departures).to eq(4)
  end

  it "returns the total number of ontime flights" do
    expect(Departure.total_on_time_flights).to eq(2)
  end

  it "returns the total number of late flights" do
    expect(Departure.total_late_flights).to eq(2)
  end

  it "returns the total ontime flights per airline" do
    expect(Departure.total_on_time_number_per_airline(@airline_one.id)).to eq(2)
  end

  it "returns the total flights per airline" do
    expect(Departure.total_flights_per_airline(@airline_one.id)).to eq(4)
  end

  it "returns the total ontime percentage" do
    expect(Departure.total_on_time_percentage(@airline_one.id)).to eq(50.0)
  end

  it "returns the last updated_at" do
    expect(Departure.last_updated_at).to eq(Time.now.strftime("%A, %B %d, %Y at %I:%M%p"))
  end

  it "returns the difference in days between the last created and first created at" do
    expect(Departure.day_length).to eq(2)
  end
end
