require 'sinatra'
require 'shouty'

class ShoutyApp < Sinatra::Application
  def initialize(*args)
    super(*args)
    @network = Network.new
    @people = {}
  end

  post "/register" do
    person = Person.new(@network, params[:position].to_i)
    @people[params[:name]] = person
    nil
  end

  post "/shout" do
    person = @people[params[:name]]
    person.shout(params[:message])
    nil
  end

  get "/last-message" do
    person = @people[params[:name]]
    person.last_heard_message || 404
  end
end
