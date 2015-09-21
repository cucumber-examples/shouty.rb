require 'capybara'
require 'shouty_app'

class WebWorld
  def initialize
    @browsers = {}
  end

  def person_is_in(person_name, geo_location)
    b = browser_for(person_name)

    b.visit('/')
    b.fill_in('person_name', :with => person_name)
    b.click_button('Login')

    b.fill_in('lat', :with => geo_location[0].to_s)
    b.fill_in('lon', :with => geo_location[1].to_s)
    b.click_button('Move')
  end

  def person_shouts(person_name, message)
    b = browser_for(person_name)

    b.fill_in('message', :with => message)
    b.click_button('Shout')
  end

  def messages_heard_by(person_name)
    b = browser_for(person_name)

    b.visit('/')
    lis = b.all('#messages_heard li')
    lis.map {|li| li.text}
  end

private

  def browser_for(person_name)
    @browsers[person_name] ||= Capybara::Session.new(:selenium, ShoutyApp)
  end

end
