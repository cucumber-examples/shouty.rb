require 'simplecov'
SimpleCov.start
require 'capybara/cucumber'
require 'shouty_app'

Capybara.app = ShoutyApp
