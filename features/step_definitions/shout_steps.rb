require 'shouty'

Given(/^Lucy is (\d+) m from Sean$/) do |distance|
  shouty = Shouty.new

  lucy = shouty.person('Lucy')
  sean = shouty.person('Sean')

  lucy.location = [distance, 0]
  sean.location = [0, 0]
end

When(/^Sean shouts "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^Lucy hears "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
