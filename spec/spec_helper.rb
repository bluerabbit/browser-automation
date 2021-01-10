require 'pry'
require 'active_support/all'

require 'turnip'
require 'turnip/capybara'
require 'webdrivers/chromedriver'

Dir.glob('spec/steps/**/*steps.rb') { |f| load f, true }
Dir.glob('spec/support/**/*.rb')    { |f| require "./#{f}" }

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('disable-notifications')
  options.add_argument('disable-translate')
  options.add_argument('disable-extensions')
  options.add_argument('disable-infobars')
  options.add_argument('window-size=1280,960')

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options)
end

Capybara.configure do |config|
  config.run_server        = false
  config.default_driver    = :chrome
  config.javascript_driver = :chrome
  config.app_host          = 'http://localhost:3000'
end

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include CapybaraHelper
end
