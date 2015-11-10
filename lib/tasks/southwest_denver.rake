desc "update delays"
task :southwest_denver => :environment do
  puts "Updating Southwest Denver API"
  FlightsPresenter.new.save
end