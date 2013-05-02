require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup :default, ENV['HEROKU_POSTGRESQL_COPPER_URL']

class Datum
  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :created_at, DateTime, :default => ->(r, p) { Time.now }
end

DataMapper.finalize
DataMapper.auto_upgrade!
