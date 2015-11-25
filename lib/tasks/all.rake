desc "update delays"
task :explode => :environment do
  times = [0,6,11,18]
  if times.include?(Time.now.hour)
    Rake::Task['atl'].execute
    Rake::Task['dallas'].execute
    Rake::Task['dca'].execute
    Rake::Task['denver'].execute
    Rake::Task['dulles'].execute
    Rake::Task['la'].execute
    Rake::Task['nyla'].execute
    Rake::Task['ohare'].execute
    Rake::Task['orf'].execute
  else
  end
end