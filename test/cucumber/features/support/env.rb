#require 'capybara'
#require 'capybara/cucumber'
#require 'capybara/mechanize/cucumber'
#require 'capybara/rspec'
#require 'capybara/poltergeist'
#require 'capybara-webkit'
#
#
##require 'ruby-debug'
#
#HOST = ENV['TEST_HOST'] || '10.10.10.10'
#BASE = "".freeze #"http://#{HOST}"
#
#Capybara.run_server = false
#Capybara.app_host = "http://#{HOST}"
#
#Capybara.default_driver    = :mechanize
##Capybara.javascript_driver = :selenium
##Capybara.javascript_driver = :webkit
#Capybara.default_driver    = :poltergeist
#Capybara.javascript_driver = :poltergeist
#Capybara.register_driver :poltergeist do |app|
#    options = {
#        :js_errors => false,
#        :timeout => 120
#    }
#    Capybara::Poltergeist::Driver.new(app, options)
#end

require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium/webdriver'
require 'byebug'

# Pass the test host in from the environment
HOST = ENV['TEST_HOST'] || '10.10.10.10'
BASE = ''.freeze
Capybara.run_server = false
Capybara.app_host = "http://#{HOST}"

# Register a driver for visible Chrome using Selenium
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

# Register a driver for headless Chrome using Selenium
Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[headless disable-gpu] },
    loggingPrefs: { browser: 'ALL' }
  )

  Capybara::Selenium::Driver.new(app,
                                 browser: :chrome,
                                 desired_capabilities: capabilities)
end

# To see the Chrome window while tests are running, set this var to true
see_visible_window_while_test_run = false
driver = see_visible_window_while_test_run ? :chrome : :headless_chrome
Capybara.default_driver    = driver
Capybara.javascript_driver = driver


Then(/^breakpoint$/) do
  breakpoint
  puts 'resuming ...'
end

# run tests headless

#require 'headless'
#headless = Headless.new
#headless.start
