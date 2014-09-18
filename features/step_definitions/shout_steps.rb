Given(/^Lucy is (\d+) m from Sean$/) do |distance|
  @lucy.location = [distance.to_i, 0]
  @sean.location = [0, 0]
end

When(/^Sean shouts "(.*?)"$/) do |message|
  @sean.shout(message)
end

When(/^Lucy moves another (\d+) m away from Sean$/) do |moved_distance|
  new_x = @lucy.location[0] + moved_distance.to_i
  old_y = @lucy.location[1]
  @lucy.location = [new_x, old_y]
end

Then(/^Lucy hears "(.*?)"$/) do |expected_message|
  visible_message_contents = @lucy.visible_messages.map(&:contents)
  assert_equal([expected_message], visible_message_contents)
end

Then(/^Lucy hears nothing$/) do
  assert_equal([], @lucy.visible_messages)
end
