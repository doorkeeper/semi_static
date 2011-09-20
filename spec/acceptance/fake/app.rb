require 'rails'
require 'action_controller/railtie'
require 'action_view/railtie'

# config
app = Class.new(Rails::Application)
app.config.root = File.dirname(__FILE__)
app.config.secret_token = "3b7cd727ee24e8444053437c36cc66c4"
app.config.session_store :cookie_store, :key => "_myapp_session"
app.config.active_support.deprecation = :log
app.initialize!

app.routes.draw do
  semi_static_for :news
  semi_static_for :event_planning_tips
end
class ApplicationController < ActionController::Base; end
