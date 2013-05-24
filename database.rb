require 'data_mapper'
require 'dm-postgres-adapter'

if ENV['MODE'] == 'travis'
  DataMapper.setup :default, 'postgresql://postgres@127.0.0.1/opendata'
else
  DataMapper.setup :default, ENV['HEROKU_POSTGRESQL_COPPER_URL']
end

class Datum
  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :created_at, DateTime, :default => ->(r, p) { Time.now }
end

DataMapper.finalize
DataMapper.auto_upgrade!
