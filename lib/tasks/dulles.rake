desc "update delays"
task :dulles => :environment do
  puts "Updating Dulles API"
  Flights.new("IAD", "WN", :ec).save
  Flights.new("IAD", "UA", :ec).save
  Flights.new("IAD", "F9", :ec).save
  Flights.new("IAD", "DL", :ec).save
  Flights.new("IAD", "AA", :ec).save
  Flights.new("IAD", "VX", :ec).save
end