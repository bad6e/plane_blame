desc "update delays"
task :la => :environment do
  puts "Updating LA API"
  Flights.new("LAX", "UA", :pc).save
  Flights.new("LAX", "F9", :pc).save
  Flights.new("LAX", "DL", :pc).save
  Flights.new("LAX", "AA", :pc).save
  Flights.new("LAX", "NK", :pc).save
  Flights.new("LAX", "B6", :pc).save
  Flights.new("LAX", "WN", :pc).save
  Flights.new("LAX", "VX", :pc).save
end