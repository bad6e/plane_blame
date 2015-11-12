desc "update delays"
task :atl => :environment do
  puts "Updating Hartsfield API"
  Flights.new("ATL", "UA", :ec).save
  Flights.new("ATL", "F9", :ec).save
  Flights.new("ATL", "DL", :ec).save
  Flights.new("ATL", "AA", :ec).save
  Flights.new("ATL", "NK", :ec).save
  Flights.new("ATL", "WN", :ec).save
end