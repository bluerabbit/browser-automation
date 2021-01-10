require 'pry'
require 'active_support/all'

require 'turnip'
require 'turnip/capybara'
require 'webdrivers/chromedriver'

Dir.glob('spec/steps/**/*steps.rb') { |f| load f, true }
Dir.glob('spec/support/**/*.rb')    { |f| require "./#{f}" }

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
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
