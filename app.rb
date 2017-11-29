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

  get '/request/view' do
    erb(:filter_request)
  end

  post '/request/view' do
    owner_email = params[:owneremail]
    @requests = Property.all(email: owner_email).requests
    # @properties = Property.all(email: owner_email)
    erb(:view_requests)
  end

  post '/request/accepted' do
    id_of_request = params[:request_id_confirmed].to_i
    approved_request = Request.get(id_of_request)
    # binding.pry
    approved_request.update(:approved => true)
  end

  get '/propertymanager' do
    erb(:propertymanager)
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
      flash.now[:confirmation_message] = "Your request for the property #{property_id} has been submited"
    else
      flash.now[:error_message] = "No such property exists"
    end
    erb(:request)
  end

  get '/property/new' do
    erb(:new_property)
  end

  post '/property/new' do
    name = params[:name]
    description = params[:description]
    price = params[:price]
    email = params[:email]
    available_date = params[:date]
    if new_property_error_message(name, description, price, email)
      flash.now[:price_error] = new_property_error_message(name, description, price, email)
      erb(:new_property)
    else
      available_date = AvailableDate.create(date: available_date)
      property = Property.create(name: name, description: description, price: price.to_i, email: email)
      property.available_dates << available_date
      property.save
      redirect '/property/new'
    end

  end

  get '/property/filter' do
    erb(:property_filter)
  end

  post '/property/my-properties' do
    email = params[:email]
    @properties = Property.all(email: email)
    erb(:filtered_properties)
  end

  get '/properties' do
    @properties = Property.all
    erb(:properties)
  end



end
