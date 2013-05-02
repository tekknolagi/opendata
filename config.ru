require './app.rb'

run Rack::Cascade.new [OpenData::API, OpenData::Web]