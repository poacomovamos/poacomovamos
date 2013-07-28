require 'mongo_mapper'
require 'bundler'
Bundler.setup


MongoMapper.setup( { 'mongo' => { 'uri' => ENV['MONGODB_URI'] || 'mongodb://localhost/pcv' } }, 'mongo')

base = File.dirname(__FILE__)
Dir.glob(base + '/models/*.rb').each { |f| require f }
Dir.glob(base + '/lib/*.rb').each { |f| require f }
