require 'timeout'

task :default => [:travis]

task :travis do
  Thread.new{
    Timeout::timeout(15) {
      `rackup config.ru`
    }
  }
end
