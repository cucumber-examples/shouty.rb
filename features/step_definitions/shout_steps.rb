require 'shouty'

Given(/^Lucy is (\d+)m away from Sean$/) do |distance|
  network = Network.new
  sean_position = 123
  lucy_position = distance.to_i + sean_position
  @sean = Person.new(network, sean_position)
  @lucy = Person.new(network, lucy_position)
end

Given(/^Lucy is out of Sean's range$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^Sean shouts "(.*?)"$/) do |message|
  @sean.shout(message)
end

When(/^Sean shouts$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^Lucy should hear "(.*?)"$/) do |expected_message|
  expect(@lucy.last_heard_message).to eq expected_message
end

Then(/^Lucy should hear Sean's message$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^Lucy should not hear "(.*?)"$/) do |not_expected_message|
  expect(@lucy.last_heard_message).not_to eq not_expected_message
end
