require 'shouty'

Given(/^Elizabeth is in "(.*?)"$/) do |location|
  @elizabeth = Person.new
  @elizabeth.location = location
end

Given(/^Charles is in "(.*?)"$/) do |location|
  @charles = Person.new
  @charles.location = location
end

When(/^Elizabeth shouts "(.*?)"$/) do |message|
  @elizabeth.shout(message)
end

Then(/^Charles should not hear the shout$/) do
  if @charles.heard_messages != []
    raise "Expected no messages, but got #{@charles.heard_messages}"
  end
end
