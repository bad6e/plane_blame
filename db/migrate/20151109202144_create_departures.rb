class CreateDepartures < ActiveRecord::Migration
  def change
    enable_extension :hstore

    create_table :departures do |t|
      t.hstore :delays
      t.references :airline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
