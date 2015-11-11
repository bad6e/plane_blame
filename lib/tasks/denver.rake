desc "update delays"
task :denver => :environment do
  puts "Updating Denver API"
  Flights.new("DEN","WN").save
  Flights.new("DEN","UA").save
  Flights.new("DEN","F9").save
  Flights.new("DEN","DL").save
  Flights.new("DEN","AA").save
  Flights.new("DEN","B6").save
  Flights.new("DEN","NK").save
end