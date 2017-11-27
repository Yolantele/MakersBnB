require 'sinatra/base'

class MakersBnB < Sinatra::Base

  get '/' do
    redirect '/home'
  end

  get '/home' do
    erb(:home)
  end

end
