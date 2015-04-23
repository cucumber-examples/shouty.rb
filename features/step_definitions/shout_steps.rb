require 'shouty'

Before do
  @network = Network.new
end

Given(/^Lucy is within Sean's range$/) do
  @sean = Person.new(@network, 0)
  @lucy = Person.new(@network, 1000)
end

Given(/^Lucy is out of Sean's range$/) do
  @sean = Person.new(@network, 0)
  @lucy = Person.new(@network, 1001)
end

When(/^Sean shouts(?: a short enough message)?$/) do
  @message = "Hi SF!"
  @sean.shout(@message)
end

When(/^Sean shouts a too\-long message$/) do
  @message = 'X' * 257
  @sean.shout(@message)
end

Then(/^Lucy should hear Sean's message$/) do
  expect(@lucy.last_heard_message).to eq @message
end

Then(/^Lucy should not hear Sean's message$/) do
  expect(@lucy.last_heard_message).not_to eq @message
end
