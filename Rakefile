require 'timeout'

task :default => [:travis]

task :travis do
  puts "starting webserver"
  Thread.new{
    Timeout::timeout(15) {
      `rackup config.ru`
    }
  }
  puts "closing webserver"
end
