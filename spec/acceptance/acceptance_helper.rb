require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require File.expand_path(File.dirname(__FILE__) + "/fake/app")
require "steak"
require 'capybara/rspec'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

require 'rspec/rails'
