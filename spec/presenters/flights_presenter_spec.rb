require 'rails_helper'

RSpec.describe Departure, type: :model do
  before(:each) do
    @airport_one   = Airport.create(name: "Denver International",
                                   code: "DEN")

    @airline_one   = Airline.create(name: "Southwest Airlines",
                                   code: "WN")

    @departure_one = Departure.create(dep_gate_delays: 10 ,
                    airline_id: @airline_one.id,
                    airport_id: @airport_one.id,
                    flight_id: 1111,
                    flight_number: '1234')


    @departure_two = Departure.create(dep_gate_delays: 16 ,
                    airline_id: @airline_one.id,
                    airport_id: @airport_one.id,
                    flight_id: 1112,
                    flight_number: '1235')

  end

  it "returns the total departures" do
    expect(FlightsPresenter.new.total_departures).to eq(2)
  end

  it "returns the total ontime departures" do
    expect(FlightsPresenter.new.total_on_time_departures).to eq(1)
  end

  it "returns the total late departures" do
    expect(FlightsPresenter.new.total_late_departures).to eq(1)
  end

  it "returns the last updated at" do
    expect(FlightsPresenter.new.last_updated_at).to eq(Time.now.strftime("%A, %B %d, %Y at %I:%M%p"))
  end

  it "returns an array of all the airline names" do
    expect(FlightsPresenter.new.airline_names).to eq(['Southwest Airlines'])
  end

  it "returns an array of the total on-time percetange for each airline " do
    expect(FlightsPresenter.new.total_percentage).to eq([50.0])
  end

  it "returns an array of the airline name and it's total percentage of on-time flights" do
    expect(FlightsPresenter.new.total_percentage_and_name).to eq([[50.0, 'Southwest Airlines']])
  end

  it "returns all the airline ids" do
    expect(FlightsPresenter.new.airline_ids).to eq([@airline_one.id])
  end
end