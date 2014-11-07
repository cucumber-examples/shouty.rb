require 'sinatra'
require 'shouty'

class ShoutyApp < Sinatra::Application
  def initialize(*args)
    super(*args)
    @shoutbox = Shoutbox.new
  end

  get '/' do
    person = @shoutbox[params[:name]]
    person.location = params[:location].to_i
    erb :index, locals: {person: person}
  end

  post '/' do
    person = @shoutbox[params[:name]]
    person.shout(params[:message])
    redirect to(request.url)
  end
end
