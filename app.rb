ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './datamapper_setup'
require 'sinatra/flash'
require './app_helper'
require 'date'
require 'pry'

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
    erb(:view_requests)
  end

  post '/request/accepted' do
    id_of_request = params[:request_id_confirmed].to_i
    approved_request = Request.get(id_of_request)
    approved_request.update(:approved => true)
    redirect '/request/view'
  end

  post '/request/declined' do
    id_of_declined = params[:request_id_declined].to_i
    declined_request = Request.get(id_of_declined)
    declined_request.destroy!
    redirect '/request/view'
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
    start_date = params[:start_date]
    end_date = params[:end_date]
    if new_property_error_message(name, description, price, email)
      flash.now[:price_error] = new_property_error_message(name, description, price, email)
      erb(:new_property)
    else
      property = Property.create(name: name, description: description, price: price.to_i, email: email)
      start_date = Date.parse(start_date)
      end_date = Date.parse(end_date)
      range = (start_date..end_date).to_a
      range.each do |night|
      night = AvailableDate.create(date: night)

      property.available_dates << night
    end
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
