require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup :default, ENV['HEROKU_POSTGRESQL_--COLOR--_URL']

class Datum
  include DataMapper::Resource

  property :id, Serial
  property :body, Text, :required => true
  property :created_at, DateTime, :required => true, :default => ->() { Time.now }
end

DataMapper.finalize
DataMapper.auto_upgrade!
