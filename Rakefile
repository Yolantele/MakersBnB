require './app'

namespace :db do
  desc 'Non Destructive Upgrade'
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "Auto Upgrade Complete"
  end

  desc 'Destructive Upgrade'
  task :migrate do
    DataMapper.auto_migrate!
    puts "Auto Migrate Complete (Data Lost :-( )"
  end
end
