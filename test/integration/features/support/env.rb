require 'capybara'
require 'capybara/cucumber'
require 'capybara/mechanize/cucumber'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara-webkit'

require 'ruby-debug'

HOST = ENV['TEST_HOST'] || '10.10.10.10'
BASE = "http://#{HOST}"

Capybara.app = "make sure this isn't nil"
Capybara.app_host = "http://#{HOST}"
Capybara.default_driver    = :mechanize
Capybara.javascript_driver = :selenium

Then(/^breakpoint$/) do
  breakpoint
  puts 'resuming ...'
end

# run tests headless

require 'headless'
headless = Headless.new
headless.start
