namespace :import do
  task :competition, ['filepath'] => :environment do |task, args|
    data = JSON.parse(File.read(args[:filepath]))

  end
end