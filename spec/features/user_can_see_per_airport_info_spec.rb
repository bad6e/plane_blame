require "rails_helper"
feature "visitor comes to home page" do

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

  scenario "user sees total PlaneBlame Stats" do
    visit root_path
    expect(page).to have_content(6)
    expect(page).to have_content(3)
    expect(page).to have_content(3)
    expect(page).to have_content(Time.now.strftime("%A, %B %d, %Y at %I:%M%p"))

    within('#search_field') do
      fill_in "search", with: @airport_one.name
    end

    expect(page).to have_css("img[src*='http://jimpunk.net/Loading/wp-content/uploads/loading1.gif']")
  end
end
