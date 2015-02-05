require 'shouty'
require 'rspec'

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
  expect(@charles.heard_messages).to eq([])
end
