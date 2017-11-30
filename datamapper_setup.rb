require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-constraints'
require './models/property.rb'
require './models/request.rb'
require './models/available_date.rb'
require './models/user.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
