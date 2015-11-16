desc "update delays"
task :all => :environment do
  times = [0,6,12,20]
  if times.include?(Time.now.hour)
    Rake::Task['atl'].execute
    Rake::Task['dallas'].execute
    Rake::Task['dca'].execute
    Rake::Task['denver'].execute
    Rake::Task['dulles'].execute
    Rake::Task['la'].execute
    Rake::Task['nyla'].execute
    Rake::Task['ohare'].execute
  else
  end
end