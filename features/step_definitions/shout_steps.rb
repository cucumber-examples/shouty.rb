require 'shouty'

World(DomainWorld)

Before do
  start_shouty
end

Given(/^Lucy is within Sean's range$/) do
  register_sean(0)
  register_lucy(1000)
end

Given(/^Lucy is out of Sean's range$/) do
  register_sean(0)
  register_lucy(1001)
end

When(/^Sean shouts(?: a short enough message)?$/) do
  make_sean_shout("Hi SF!")
end

When(/^Sean shouts a too\-long message$/) do
  make_sean_shout('X' * 257)
end

Then(/^Lucy should hear Sean's message$/) do
  expect_lucy_to_have_heard_message
end

Then(/^Lucy should not hear Sean's message$/) do
  expect_lucy_not_to_have_heard_message
end
