desc "update delays"
task :nyla => :environment do
  puts "Updating Laguardia API"
  Flights.new("LGA", "UA", :ec).save
  Flights.new("LGA", "F9", :ec).save
  Flights.new("LGA", "DL", :ec).save
  Flights.new("LGA", "AA", :ec).save
  Flights.new("LGA", "VX", :ec).save
  Flights.new("LGA", "B6", :ec).save
  Flights.new("LGA", "NK", :ec).save
  Flights.new("LGA", "WN", :ec).save
end