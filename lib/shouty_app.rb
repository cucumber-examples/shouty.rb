require 'sinatra'
require_relative 'shouty'

class ShoutyApp < Sinatra::Application
  set :people, {}
  set :shout_server, ShoutServer.new
  use Rack::Session::Cookie, secret: 'keyboard cat'

  before do
    # Assign a unique person name to the visitor's session
    people_count = settings.people.length
    session[:person_name] ||= "Guest #{people_count}"
  end

  helpers do
    # Get a person object using the session's person_name as key
    def person
      person_name = session[:person_name]
      person = settings.people[person_name] ||= Person.new(person_name, settings.shout_server)
      if params[:lat] && params[:lon]
        person.geo_location = [params[:lat].to_f, params[:lon].to_f]
      end
      person
    end
  end

  get '/' do
    erb :index, locals: {person_name: session[:person_name], person: person}
  end

  post '/' do
    person.shout(params[:message])
    redirect to(request.url)
  end
end
