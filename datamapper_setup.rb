require 'data_mapper'
require 'dm-postgres-adapter'
require './models/property.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
