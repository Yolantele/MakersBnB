ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './datamapper_setup'

class MakersBnB < Sinatra::Base

  get '/' do
    redirect '/home'
  end

  get '/home' do
    erb(:home)
  end

  get '/request/new' do
    erb(:request)
  end

  post '/request/new' do
    property_id = params[:property_id].to_i
    traveller_name = params[:traveller_name]
    traveller_email = params[:traveller_email]
    date = params[:date]
    new_request = Request.new(name: traveller_name, email: traveller_email, date: date )
    property = Property.get(property_id)
    property.requests << new_request
    property.save
  end

  get '/property/new' do
    erb(:new)
  end

  post '/property/new' do
    name = params[:name]
    description = params[:description]
    price = params[:price].to_i
    email = params[:email]
    property = Property.create(name: name, description: description, price: price, email: email)
  end


end
