require 'shouty'

Before do
  @shouty = Shouty.new
end

Given(/^Gush's location is (more|less) than (\d+)km from Elliott$/) do |more_or_less, distance|
  heathrow = [51.4716341,-0.4887383]
  sky      = [51.4850955,-0.3223852]

  @shouty.person_is_in("Elliott", sky)

  if more_or_less == 'more'
    @shouty.person_is_in("Gush", heathrow)
  else
    @shouty.person_is_in("Gush", sky)
  end
end

When(/^Elliott sends a message$/) do
  @shouty.send_message("Elliott", "You around Gush?")
end

Then(/^Gush shouldn't receive any messages$/) do
  actual = @shouty.messages_received_by("Gush")
  expect(actual).to eq([])
end

Then(/^Gush should receive Elliot's message$/) do
  actual = @shouty.messages_received_by("Gush")
  expect(actual).to eq(["You around Gush?"])
end
