ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './datamapper_setup'
require 'sinatra/flash'
require './app_helper'
require 'date'
require 'pry'
require './Twillio_sms.rb'

class MakersBnB < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb(:sign_in)
  end

  post '/users/new' do
    email = params[:email_sign_up]
    password = params[:password_sign_up]
    mobile_number = params[:mobile_number]
    user = User.create(email: email, password: password, mobile_number: mobile_number)
    session[:user_id] = user.id
    Twiliosms.new.send_confirm_sms
    redirect '/users/new'
  end

  get '/users/new' do
  current_user
    erb(:welcome_user)
  end


  post '/users/session' do
    user = User.authenticate(params[:email_in], params[:password_in])
    if user
      session[:user_id] = user.id
      redirect '/users/session'
    else
      flash.now[:error] = 'You have entered an incorrect email or password'
      erb(:sign_in)
    end
  end

  get '/users/session' do
    current_user
    erb(:welcome_back)
  end

  delete '/users/session' do
    session[:user_id] = nil
  #  flash.keep[:notice] = 'thanks for visiting!'
    redirect to '/'
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

    @requests = current_user.houses.requests 
    erb(:view_requests)
  end

  post '/request/accepted' do
    approved_request = Request.get(params[:request_id_confirmed].to_i)
    approved_request.update(:approved => true)

    redirect '/request/view'
  end

  post '/request/declined' do
    id_of_declined = params[:request_id_declined].to_i
    Request.get(id_of_declined).destroy

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
    property = House.get(property_id)
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

    name        = params[:name]
    description = params[:description]
    price       = params[:price]
    start_date  = params[:start_date]
    end_date    = params[:end_date]
    if new_property_error?(name, description, price)
      flash.now[:error_message] = new_property_error_message(name, description, price)
    else
      create_property(name, description, price, start_date, end_date)
      flash.now[:confirmation_message] = 'Your property has been added to MakersBnB'
    end
    erb(:new_property)
  end

  get '/property/search' do
    erb :search_properties
  end

  post '/property/search' do
    @search_results = search_properties(params[:chosen_date], params[:max_price])
    erb :property_search_results
  end

  get '/property/filter' do
    erb(:property_filter)
  end

  post '/property/my-properties' do
    @properties = current_user.houses
    erb(:filtered_properties)
  end

  get '/properties' do
    @properties = House.all
    erb(:properties)
  end
end
