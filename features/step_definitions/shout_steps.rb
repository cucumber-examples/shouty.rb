Given(/^Lucy is (\d+) m from Sean$/) do |distance|
  @lucy.location = [distance.to_i, 0]
  @sean.location = [0, 0]
end

When(/^Sean shouts "(.*?)"$/) do |message|
  @sean.shout(message)
end

Then(/^Lucy hears "(.*?)"$/) do |expected_message|
  visible_message_contents = @lucy.visible_messages.map(&:contents)
  assert_equal([expected_message], visible_message_contents)
end

Then(/^Lucy hears nothing$/) do
  assert_equal([], @lucy.visible_messages)
end
