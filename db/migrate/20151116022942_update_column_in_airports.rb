class UpdateColumnInAirports < ActiveRecord::Migration
  def change
    enable_extension 'citext'

    change_column :airports, :name, :citext
  end
end
