<<<<<<< HEAD
require 'sinatra/base'
#require_relative ''

class MakersBnB < Sinatra::Base

  get '/' do
    redirect '/home'
  end

  get '/home' do

  end







end
=======
ENV['RACK_ENV'] = 'development'

require './datamapper_setup'
>>>>>>> origin/mst
