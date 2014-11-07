require 'sinatra'

class ShoutyApp < Sinatra::Application
  get '/' do
    erb :index
  end
end
