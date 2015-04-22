require 'shouty'

Given(/^Lucy is within Sean's range$/) do
  network = Network.new
  sean_position = 0
  lucy_position = 1000
  @sean = Person.new(network, sean_position)
  @lucy = Person.new(network, lucy_position)
end

Given(/^Lucy is out of Sean's range$/) do
  network = Network.new
  sean_position = 0
  lucy_position = 1001
  @sean = Person.new(network, sean_position)
  @lucy = Person.new(network, lucy_position)
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
