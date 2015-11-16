desc "update delays"
task :denver => :environment do
  puts "Updating Denver API"
  times = [0,6,12,13]
  if times.include?(Time.now.hour)
    Flights.new("DEN", "WN", :mt).save
    Flights.new("DEN", "UA", :mt).save
    Flights.new("DEN", "F9", :mt).save
    Flights.new("DEN", "DL", :mt).save
    Flights.new("DEN", "AA", :mt).save
    Flights.new("DEN", "B6", :mt).save
    Flights.new("DEN", "NK", :mt).save
  end
end