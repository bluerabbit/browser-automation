require 'rubygems'

require 'pry'
require 'active_support/all'

require 'turnip'
require 'turnip/capybara'
require 'capybara/rspec'

Dir.glob('spec/steps/**/*steps.rb') { |f| load f, true }
Dir.glob('spec/support/**/*.rb')    { |f| require "./#{f}" }

Capybara.configure do |config|
  config.run_server        = false
  config.default_driver    = :selenium
  config.javascript_driver = :selenium
  config.app_host          = 'http://localhost:3000'
end

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include CapybaraHelper
end
