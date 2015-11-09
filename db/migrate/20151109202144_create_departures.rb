class CreateDepartures < ActiveRecord::Migration
  def change
    create_table :departures do |t|
      t.datetime :scheduled_gate_dep
      t.datetime :actual_gate_dep
      t.datetime :scheduled_gate_ar
      t.datetime :actual_gate_ar
      t.references :airline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
