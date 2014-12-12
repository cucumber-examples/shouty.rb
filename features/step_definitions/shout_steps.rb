require 'shouty'

Given(/^the shouting range is (\d+)ft$/) do |range|
  @network = Network.new(range.to_i)
end

Given(/^Lucy is (\d+)ft away from Sean$/) do |distance|
  @sean = Person.new(@network, 0)
  @lucy = Person.new(@network, distance.to_i)
end

Given(/^Lucy is in range of Sean$/) do
  @sean = Person.new(@network, 0)
  @lucy = Person.new(@network, 0)
end

When(/^Sean shouts "(.*?)"$/) do |content|
  @sean.shout(content)
end

When(/^Sean shouts:$/) do |content|
  @sean.shout(content)
end

Then(/^Lucy hears "(.*?)"$/) do |content|
  if @lucy.last_heard_shout != content
    raise "Expected Lucy to hear: #{content}"
  end
end

Then(/^Lucy does not hear "(.*?)"$/) do |content|
  if @lucy.last_heard_shout == content
    raise "Expected Lucy not to hear: #{content}"
  end
end

Then(/^Lucy does not hear:$/) do |content|
  if @lucy.last_heard_shout == content
    raise "Expected Lucy not to hear: #{content}"
  end
end
