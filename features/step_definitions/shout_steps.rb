Given(/^(.*) is (\d+) m from (.*)$/) do |away_person, distance, center_person|
  @shouty.person(away_person).location = [distance.to_i, 0]
  @shouty.person(center_person).location = [0, 0]
end

When(/^(.*) shouts "(.*?)"$/) do |shouter, message|
  @shouty.person(shouter).shout(message)
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

Then(/^(.*) hears:$/) do |who, expected_messages|
  visible_message_contents = @shouty.person(who).visible_messages.map do |message|
    [message.contents]
  end

  expected_messages.diff!(visible_message_contents)
end
