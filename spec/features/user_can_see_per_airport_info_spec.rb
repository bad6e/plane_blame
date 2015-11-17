require "rails_helper"
RSpec.describe Departure, type: :feature do
  before(:each) do
    @airport_one   = Airport.create(name: "Denver International",
                                    code: "DEN")

    @airline_one   = Airline.create(name: "Southwest Airlines",
                                    code: "WN")

    @airline_two    = Airline.create(name: "American Airlines",
                                   code: "AA")

    @airline_three  = Airline.create(name: "Frontier",
                                   code: "F9")

    @airline_four   = Airline.create(name: "United Airlines",
                                   code: "UA")

    @departure_one = Departure.create(dep_gate_delays: 10 ,
                    airline_id: @airline_one.id,
                    airport_id: @airport_one.id,
                    flight_id: 1111,
                    flight_number: '1234')


    @departure_two = Departure.create(dep_gate_delays: 16 ,
                    airline_id: @airline_two.id,
                    airport_id: @airport_one.id,
                    flight_id: 1112,
                    flight_number: '1236')

    @departure_two = Departure.create(dep_gate_delays: 18 ,
                    airline_id: @airline_three.id,
                    airport_id: @airport_one.id,
                    flight_id: 1113,
                    flight_number: '1237')

    @departure_two = Departure.create(dep_gate_delays: 20 ,
                    airline_id: @airline_four.id,
                    airport_id: @airport_one.id,
                    flight_id: 1114,
                    flight_number: '1238')

    @departure_two = Departure.create(dep_gate_delays: 1,
                    airline_id: @airline_one.id,
                    airport_id: @airport_one.id,
                    flight_id: 1115,
                    flight_number: '1239')

    @departure_two = Departure.create(dep_gate_delays: 2 ,
                    airline_id: @airline_one.id,
                    airport_id: @airport_one.id,
                    flight_id: 1116,
                    flight_number: '1210')

  end

  it "user sees total PlaneBlame Stats" do
    visit root_path
    expect(page).to have_content(6)
    expect(page).to have_content(3)
    expect(page).to have_content(3)

    within('#search_field') do
      fill_in "search", with: @airport_one.name
    end
  end

  it "user can see the best to worst airlines", js: true do
    visit root_path
    click_button "Click Here for the Percentages"

    expect(page).to have_content(@airline_one.name)
    expect(page).to have_content(@airline_two.name)
    expect(page).to have_content(@airline_three.name)
    expect(page).to have_content(@airline_four.name)
    expect(page).to have_content(100)
    expect(page).to have_content(0)
  end
end
