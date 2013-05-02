require './app.rb'

use Rack::Attack

Rack::Attack.throttle('req/ip', :limit => 5, :period => 1.second) do |req|
  req.ip
end

run Rack::Cascade.new [OpenData::API, OpenData::Web]
