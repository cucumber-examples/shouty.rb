require 'shouty'
require 'coordinate'

ARBITRARY_MESSAGE = "Hello, world"

Before do
  @shouty = Shouty.new
end

Given('Lucy is at {int}, {int}') do |x, y|
  @shouty.set_location("Lucy", Coordinate.new(x, y))
end

Given('Sean is at {int}, {int}') do |x, y|
  @shouty.set_location("Sean", Coordinate.new(x, y))
end

When('Sean shouts') do
  @shouty.shout("Sean", ARBITRARY_MESSAGE)
end

Then('Lucy should hear Sean') do
  expect(@shouty.messages_heard_by("Lucy")['Sean']).to eq(ARBITRARY_MESSAGE)
end

Then('Lucy should hear nothing') do
  expect(@shouty.messages_heard_by("Lucy")).to eq({})
end
