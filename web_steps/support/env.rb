require 'capybara/cucumber'
require 'shouty_app'

# module ApiHelper
#   def app
#     ShoutyApp
#   end
# end
#
# World(ApiHelper)
#
# World(Rack::Test::Methods)
Capybara.app = ShoutyApp

# module ApiHelper
#   #include Rack::Test::Methods
#
#   def app
#     puts "AM I HERE?"
#     ShoutyApp
#   end
# end
#
# World(ApiHelper)
