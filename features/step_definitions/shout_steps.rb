require 'shouty'

Given(/^Lucy is (\d+) m from Sean$/) do |distance|
  @shouty = Shouty.new

  lucy = @shouty.person('Lucy')
  sean = @shouty.person('Sean')

  lucy.location = [distance, 0]
  sean.location = [0, 0]
end

When(/^Sean shouts "(.*?)"$/) do |message|
  sean = @shouty.person('Sean')
  sean.shout(message)
end

Then(/^Lucy hears "(.*?)"$/) do |expected_message|
  lucy = @shouty.person('Lucy')
  if lucy.visible_messages != [expected_message]
    raise "Expected #{[expected_message]} but got #{lucy.visible_messages}"
  end
end

Then(/^Lucy hears nothing$/) do
  lucy = @shouty.person('Lucy')
  if lucy.visible_messages != []
    raise "Expected [] but got #{lucy.visible_messages}"
  end
end
