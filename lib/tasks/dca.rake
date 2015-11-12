desc "update delays"
task :dca => :environment do
  puts "Updating DCA API"
  Flights.new("DCA","WN",:ec).save
  Flights.new("DCA","F9",:ec).save
  Flights.new("DCA","DL",:ec).save
  Flights.new("DCA","AA",:ec).save
  Flights.new("DCA","B6",:ec).save
  Flights.new("DCA","UA",:ec).save
  Flights.new("DCA","VX",:ec).save
end