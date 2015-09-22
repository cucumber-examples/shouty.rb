require 'shouty'

Given(/^Gush's location is more than (\d+)km from Elliott$/) do |distance|
  heathrow = [51.4716341,-0.4887383]

  shouty = Shouty.new

  shouty.person_is_in("Gush", heathrow)
  shouty.person_is_in("Elliott", sky)
end

When(/^Elliott sends a message$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Gush shouldn't receive a message from Elliott$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
