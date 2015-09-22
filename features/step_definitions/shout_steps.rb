require 'shouty'

Before do
  @shouty = Shouty.new
end

Given(/^Gush's location is more than (\d+)km from Elliott$/) do |distance|
  heathrow = [51.4716341,-0.4887383]
  sky      = [51.4850955,-0.3223852]

  @shouty.person_is_in("Gush", heathrow)
  @shouty.person_is_in("Elliott", sky)
end

When(/^Elliott sends a message$/) do
  @shouty.send_message("Elliott", "You around Gush?")
end

Then(/^Gush shouldn't receive any messages$/) do
  actual = @shouty.messages_received_by("Gush")
  if ([] != actual)
    raise "Expected nothing, but got #{actual}"
  end
end
