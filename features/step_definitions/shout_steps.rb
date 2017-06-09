require 'shouty'

ARBITRARY_MESSAGE = "Hello, world"

Before do
  @shouty = Shouty.new
end

Given(/^Lucy is at (\d+), (\d+)$/) do |x, y|
  @shouty.set_location("Lucy", Coordinate.new(x, y))
end

Given(/^Sean is at (\d+), (\d+)$/) do |x, y|
  @shouty.set_location("Sean", Coordinate.new(x, y))
end

When(/^Sean shouts$/) do
  @shouty.shout("Sean", ARBITRARY_MESSAGE)
end

Then(/^Lucy should hear Sean$/) do
  expect(@shouty.messages_heard_by("Lucy").length).to eq(1)
end

Then(/^Lucy should hear nothing$/) do
  expect(@shouty.messages_heard_by("Lucy")).to eq({})
end
