require 'sinatra'
require 'tilt/erb'
require 'shouty'

class ShoutyApp < Sinatra::Application
  set :shouty, Shouty.new
  set :logging, nil

  random_string = (0...8).map { (65 + rand(26)).chr }.join
  use Rack::Session::Cookie, :secret => random_string # so cookies expire on server restart

  get '/' do
    messages_heard = session[:person_name].nil? ? nil : settings.shouty.messages_heard_by(session[:person_name])
    geo_location   = session[:person_name].nil? ? nil : settings.shouty.geo_location_of(session[:person_name])
    erb :index, locals: {messages_heard: messages_heard, geo_location: geo_location}
  end

  post '/login' do
    session[:person_name] = params[:person_name]
    settings.shouty.person_is_in(session[:person_name], nil)
    redirect to('/')
  end

  post '/positions' do
    geo_location = [params[:lat].to_f, params[:lon].to_f]
    settings.shouty.person_is_in(session[:person_name], geo_location)
    redirect to('/')
  end

  post '/messages' do
    settings.shouty.person_shouts(session[:person_name], params[:message])
    redirect to('/')
  end
end
