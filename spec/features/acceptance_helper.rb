require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path(File.dirname(__FILE__) + "/fake/app")
require 'capybara/rspec'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

require 'rspec/rails'

Capybara.configure do |config|
  config.match = :prefer_exact
  config.ignore_hidden_elements = false
end
