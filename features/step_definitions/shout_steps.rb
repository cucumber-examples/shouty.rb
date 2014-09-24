# step_definitions/shout_steps.rb

require 'shouty'

Given(/^Gertrude is (\d+) m away from Bob$/) do |distance|
  shouty = Shouty.new
  @bob = shouty.person("Bob")
  @gertrude = shouty.person("Gertrude")
  @bob.position = [0, 0]
  @gertrude.position = [0, distance.to_i]
end

When(/^Bob shouts "(.*?)"$/) do |message|
  @bob.shout(message)
end

Then(/^Gertrude hears "(.*?)"$/) do |expected_message|
  expect(@gertrude.received_messages).to eq([expected_message])
end
