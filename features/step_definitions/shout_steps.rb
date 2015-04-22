# features/step_definitions/shout_steps.rb

require 'shouty'

Given(/^Lucy is (\d+)m away from Sean$/) do |distance|
  network = Network.new
  @sean = Person.new(network, 0)
  @lucy = Person.new(network, distance.to_i)
end

When(/^Sean shouts "(.*?)"$/) do |message|
  @sean.shout(message)
end

Then(/^Lucy hears "(.*?)"$/) do |expected_message|
  if @lucy.last_heard_message != expected_message
    raise "Expected Lucy to hear #{expected_message}, got #{@lucy.last_heard_message.inspect} instead"
  end
end

Then(/^Lucy should not hear "(.*?)"$/) do |not_expected_message|
  if @lucy.last_heard_message == not_expected_message
    raise "Expected Lucy not to hear #{not_expected_message} but she heard it!"
  end
end
