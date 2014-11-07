require 'shouty'
require 'shouty_app'

Before do
  @sean = Capybara::Session.new(:selenium, ShoutyApp)
  @lucy = Capybara::Session.new(:selenium, ShoutyApp)
  @sean.visit('/?name=Sean')
  @lucy.visit('/?name=Lucy')
end

Given(/^Lucy is (\d+)ft away from Sean$/) do |distance|
  @sean.visit('/?name=Sean&location=0')
  @lucy.visit('/?name=Lucy&location=' + distance)
end

When(/^Sean shouts "(.*?)"$/) do |message|
  @sean.fill_in('Message', with: message)
  @sean.click_button('Shout!')
  @seans_message = message
end

Then(/^Lucy should not hear Sean's shout$/) do
  @lucy.visit(@lucy.current_url)
  last_heard_message = @lucy.find('#last_heard_message').text rescue nil
  if last_heard_message == @seans_message
    raise "Lucy heard Sean's message (but we didn't expect her to)"
  end
end

Then(/^Lucy should hear Sean's shout$/) do
  @lucy.visit(@lucy.current_url)
  last_heard_message = @lucy.find('#last_heard_message').text rescue nil
  if last_heard_message != @seans_message
    raise "Lucy heard Sean's message (but we didn't expect her to)"
  end
end

Then(/^Sean should not hear himself$/) do
  @sean.visit(@sean.current_url)
  last_heard_message = @sean.find('#last_heard_message').text rescue nil
  if last_heard_message == @seans_message
    raise "Sean heard himself - that's bad"
  end
end
