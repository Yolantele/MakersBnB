ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './datamapper_setup'
require 'sinatra/flash'
require './app_helper'

class MakersBnB < Sinatra::Base
  register Sinatra::Flash

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
    if property
      property.requests << new_request
      property.save
    else
      flash.now[:error_message] = 'No such property exists'
      erb(:request)
    end
  end

  get '/property/new' do
    erb(:new)
  end

  post '/property/new' do
    name = params[:name]
    description = params[:description]
    price = params[:price]
    email = params[:email]
    if new_property_error_message(name, description, price, email)
      flash.now[:price_error] = new_property_error_message(name, description, price, email)
      erb(:new)
    else
      Property.create(name: name, description: description, price: price.to_i, email: email)
    end
  end

  get '/properties' do
    @properties = Property.all
    erb(:properties)
  end

end
