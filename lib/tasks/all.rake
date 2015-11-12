desc "update delays"
task :all => :environment do
  puts "Updating All"
  Rake::Task['atl'].execute
  Rake::Task['dallas'].execute
  Rake::Task['dca'].execute
  Rake::Task['denver'].execute
  Rake::Task['dulles'].execute
  Rake::Task['la'].execute
  Rake::Task['nyla'].execute
  Rake::Task['ohare'].execute
end