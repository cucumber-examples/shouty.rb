require 'rack/test'
require 'shouty_app'

World(Rack::Test::Methods)

module ApiWorld
  def app
    ShoutyApp.new
  end

  def start_shouty
    # no-op, handled by Rack::Test
  end

  def register_sean(position)
    register_person("Sean", position)
  end

  def register_lucy(position)
    register_person("Lucy", position)
  end

  def make_sean_shout(message)
    @message = message
    post "/shout", { name: "Sean", message: message }
    expect(last_response.status).to eq 200
  end

  def expect_lucy_to_have_heard_message
    get "/last-message", { name: "Lucy" }
    expect(last_response.status).to eq 200
    expect(last_response.body).to eq @message
  end

  def expect_lucy_not_to_have_heard_message
    get "/last-message", { name: "Lucy" }
    expect(last_response.status).to eq 404
    expect(last_response.body).not_to eq @message
  end

  private

  def register_person(name, position)
    post "/register", { name: name, position: position }
    expect(last_response.status).to eq 200
  end
end
