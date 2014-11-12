require 'shouty'
require 'shouty_app'

Before do
  @sean = Capybara::Session.new(:poltergeist, ShoutyApp)
  @lucy = Capybara::Session.new(:poltergeist, ShoutyApp)
end

Given(/^Lucy is (\d+)ft away from Sean$/) do |distance|
  @sean.visit("/?name=Sean&location=0")
  @lucy.visit("/?name=Lucy&location=#{distance}")
end

When(/^Sean shouts "(.*?)"$/) do |message|
  @sean.fill_in('Message', :with => message)
  @sean.click_button('Shout!')
  @seans_shout = message
end

Then(/^Lucy should not hear Sean's shout$/) do
  # Reload the page
  @lucy.visit(@lucy.current_url)
  # Find the dom element with the text. Work around bug in Selenium causing
  # empty divs to not be found (Capybara::ElementNotFound)
  last_heard_message = @lucy.find(:css, '#last_heard_message').text rescue ''

  if last_heard_message == @seans_shout
    raise "Lucy heard Sean, but we didn't expect her to"
  end

  # Compare to Sean's latest shout
  # Raise error if same
end

Then(/^Lucy should hear Sean's shout$/) do
  pending
end

Then(/^Sean should not hear himself$/) do
  pending
end
