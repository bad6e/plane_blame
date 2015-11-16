desc "update delays"
task :denver => :environment do
  puts "Updating Denver API"
  Flights.new("DEN", "WN", :mt).save
  Flights.new("DEN", "UA", :mt).save
  Flights.new("DEN", "F9", :mt).save
  Flights.new("DEN", "DL", :mt).save
  Flights.new("DEN", "AA", :mt).save
  Flights.new("DEN", "B6", :mt).save
  Flights.new("DEN", "NK", :mt).save
end