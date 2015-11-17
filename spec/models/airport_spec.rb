require 'rails_helper'

RSpec.describe Airport, type: :model do
  let(:airport_one) {
    Airport.create(name: "Denver International", code: "DEN")
  }

  it "is valid" do
    expect(airport_one).to be_valid
  end

  it "is invalid without a name" do
    airport_one.name = nil
    expect(airport_one).to be_invalid
  end
end
