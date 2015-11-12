desc "update delays"
task :dallas => :environment do
  puts "Updating Dallas API"
  Flights.new("DFW", "UA", :cc).save
  Flights.new("DFW", "F9", :cc).save
  Flights.new("DFW", "DL", :cc).save
  Flights.new("DFW", "AA", :cc).save
  Flights.new("DFW", "NK", :cc).save
  Flights.new("DFW", "B6", :cc).save
end