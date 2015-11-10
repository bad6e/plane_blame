class AddFlightNumberToDepartures < ActiveRecord::Migration
  def change
    add_column :departures, :flight_number, :string
  end
end
