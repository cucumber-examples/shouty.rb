require 'shouty'

Given(/^Lucy is (\d+)ft away from Sean$/) do |distance|
  shoutbox = Shoutbox.new
  @sean = Person.new(shoutbox)
  @lucy = Person.new(shoutbox)
  @sean.location = 0
  @lucy.location = distance
end

When(/^Sean shouts "(.*?)"$/) do |message|
  @sean.shout(message)
  @seans_message = message
end

Then(/^Lucy should not hear Sean's shout$/) do
  if @lucy.last_heard_message == @seans_message
    raise "Lucy heard Sean's message (but we didn't expect him to)"
  end
end

Then(/^Lucy should hear Sean's shout$/) do
  if @lucy.last_heard_message != @seans_message
    raise "Lucy did not hear the message (but we expected her to)"
  end
end
