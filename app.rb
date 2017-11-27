ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './datamapper_setup'
require 'sinatra/base'


class MakersBnB < Sinatra::Base

  get '/' do
    redirect '/home'
  end

  get '/home' do
    erb(:home)
  end


  get '/property/new' do
    erb(:new)
  end

  post '/property/new' do
    name = params[:name]
    description = params[:description]
    price = params[:price]
    email = params[:email]
    property = Property.create(name: name, description: description, price: price, email: email)
    p property
  end

end
