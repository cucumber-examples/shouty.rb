require 'capybara'
require 'shouty_app'

class WebWorld
  def initialize
    @browsers = {}
  end

  def person_is_in(person_name, geo_location)
    browser = browser_for(person_name)
    browser.visit('/')

    login(browser, person_name)
    set_location(browser, geo_location)
  end

  def person_shouts(person_name, message)
    browser = browser_for(person_name)

    browser.fill_in('message', with: message)
    browser.click_button('Shout')
  end

  def messages_heard_by(person_name)
    browser = browser_for(person_name)
    browser.visit('/')
    li_elements = browser.all('#messages_heard li')
    messages = li_elements.map { |li| li.text }
  end

private

  def login(browser, person_name)
    browser.fill_in('person_name', with: person_name)
    browser.click_button('Login')
  end

  def set_location(browser, geo_location)
    browser.fill_in('lat', with: geo_location[0])
    browser.fill_in('lon', with: geo_location[1])
    browser.click_button('Move')
  end

  def browser_for(person_name)
    @browsers[person_name] ||= Capybara::Session.new(:selenium, ShoutyApp)
  end

end
