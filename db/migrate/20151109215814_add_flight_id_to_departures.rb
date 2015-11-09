class AddFlightIdToDepartures < ActiveRecord::Migration
  def change
    add_column :departures, :flight_id, :integer
  end
end
