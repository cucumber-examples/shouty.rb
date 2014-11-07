require 'shouty'

Before do
  visit '/'
end

Given(/^Lucy is (\d+)ft away from Sean$/) do |distance|
  shoutbox = Shoutbox.new
  @sean = Person.new(shoutbox)
  @lucy = Person.new(shoutbox)
  @sean.location = 0
  @lucy.location = distance
end

When(/^Sean shouts "(.*?)"$/) do |message|
  fill_in('Message', with: message)
  click_button('Shout!')
end

Then(/^Lucy should not hear Sean's shout$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^Lucy should hear Sean's shout$/) do
  pending # express the regexp above with the code you wish you had
end
