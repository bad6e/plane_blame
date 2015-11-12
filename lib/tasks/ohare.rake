desc "update delays"
task :ohare => :environment do
  puts "Updating Ohare API"
  Flights.new("ORD", "UA", :cc).save
  Flights.new("ORD", "F9", :cc).save
  Flights.new("ORD", "DL", :cc).save
  Flights.new("ORD", "AA", :cc).save
  Flights.new("ORD", "VX", :cc).save
  Flights.new("ORD", "B6", :cc).save
  Flights.new("ORD", "NK", :cc).save
end