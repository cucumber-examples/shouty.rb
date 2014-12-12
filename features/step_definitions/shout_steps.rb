require 'shouty'

Before do
  @network = Network.new
end

Given(/^Lucy is (\d+)ft away from Sean$/) do |distance|
  @sean = Person.new(@network)
  @lucy = Person.new(@network)
end

When(/^Sean shouts "(.*?)"$/) do |content|
  @sean.shout(content)
end

Then(/^Lucy hears "(.*?)"$/) do |content|
  if @lucy.last_heard_shout != content
    raise "Expected Lucy to hear: #{content}"
  end
end
