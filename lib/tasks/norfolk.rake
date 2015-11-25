desc "update delays"
task :orf => :environment do
  puts "Updating Norfolk API"
  Flights.new("ORF","WN",:ec).save
  Flights.new("ORF","DL",:ec).save
  Flights.new("ORF","AA",:ec).save
  Flights.new("ORF","UA",:ec).save
end