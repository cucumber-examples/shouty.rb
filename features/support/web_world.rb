require 'capybara'
require 'shouty_app'

class WebWorld
  def initialize
    @browsers = {}
  end

private

  def browser_for(person_name)
    @browsers[person_name] ||= Capybara::Session.new(:selenium, ShoutyApp)
  end

end
