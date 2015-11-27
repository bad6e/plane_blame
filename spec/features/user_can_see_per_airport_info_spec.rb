require "rails_helper"
RSpec.describe Departure, type: :feature do
  before(:each) do
    @airport_one   = Airport.create(name: "Denver International",
                                    code: "DEN")

    @airline_one   = Airline.create(name: "Southwest Airlines",
                                    code: "WN")

    @airline_two   = Airline.create( name: "American Airlines",
                                    code: "AA")

    @airline_three = Airline.create(name: "Frontier Airlines",
                                    code: "F9")

    @airline_four  = Airline.create(name: "United Airlines",
                                    code: "UA")

    Departure.create(dep_gate_delays: 16 ,
                    airline_id: @airline_two.id,
                    airport_id: @airport_one.id,
                    flight_id: 1112,
                    flight_number: '1236')

    Departure.create(dep_gate_delays: 13 ,
                    airline_id: @airline_two.id,
                    airport_id: @airport_one.id,
                    flight_id: 1233,
                    flight_number: '1236')

    Departure.create(dep_gate_delays: 18 ,
                    airline_id: @airline_three.id,
                    airport_id: @airport_one.id,
                    flight_id: 1113,
                    flight_number: '1237')

    Departure.create(dep_gate_delays: 20 ,
                    airline_id: @airline_four.id,
                    airport_id: @airport_one.id,
                    flight_id: 1114,
                    flight_number: '1238')

    Departure.create(dep_gate_delays: 1,
                    airline_id: @airline_one.id,
                    airport_id: @airport_one.id,
                    flight_id: 1115,
                    flight_number: '1239')

    Departure.create(dep_gate_delays: 2 ,
                    airline_id: @airline_one.id,
                    airport_id: @airport_one.id,
                    flight_id: 1116,
                    flight_number: '1210')

    Departure.create(dep_gate_delays: 16 ,
                    airline_id: @airline_one.id,
                    airport_id: @airport_one.id,
                    flight_id: 1111,
                    flight_number: '1234')

  end

  xit "user sees total PlaneBlame Stats", js: true do
    visit root_path

    within('.odometer1') do
      expect(page).to have_content(7)
    end

    within('.odometer2') do
      expect(page).to have_content(3)
    end

    within('.odometer3') do
      expect(page).to have_content(4)
    end

    within('#search_field') do
      fill_in "search", with: @airport_one.name
    end
  end

  it "user can see the best to worst airlines in isotope graph" do
    visit root_path

    expect(page).to have_content(50)
    expect(page).to have_content(67)
    expect(page).to have_content(0)
    expect(page).to have_content('On-Time')
  end
end
