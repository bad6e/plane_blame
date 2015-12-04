require 'rails_helper'

RSpec.describe Airline, type: :model do

  let(:airline_one) {
    Airline.create(name: "Southwest Airlines", code: "WN")
  }

  let(:airline_two) {
    Airline.create(name: "American Airlines", code: "AA")
  }

  it "is valid" do
    expect(airline_one).to be_valid
  end

  it "is invalid without a name" do
    airline_one.name = nil
    expect(airline_one).to be_invalid
  end
end
