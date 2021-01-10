require 'pry'
require 'capybara/dsl'
require 'webdrivers'

include Capybara::DSL

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :chrome

visit "http://www.google.com"

# binding.pry

Capybara.current_session.driver.quit
