# features/step_definitions/shout_steps.rb

require 'shouty'

Given(/^Lucy is (\d+)m away from Sean$/) do |distance|
  network = Network.new
  sean_position = 123
  lucy_position = distance.to_i + sean_position
  @sean = Person.new(network, sean_position)
  @lucy = Person.new(network, lucy_position)
end

When(/^Sean shouts "(.*?)"$/) do |message|
  @sean.shout(message)
end

Then(/^Lucy should hear "(.*?)"$/) do |expected_message|
  if @lucy.last_heard_message != expected_message
    raise "Expected Lucy to hear #{expected_message}, got #{@lucy.last_heard_message.inspect} instead"
  end
end

Then(/^Lucy should not hear "(.*?)"$/) do |not_expected_message|
  if @lucy.last_heard_message == not_expected_message
    raise "Expected Lucy not to hear #{not_expected_message} but she heard it!"
  end
end
