require 'active_support/core_ext/module/delegation.rb'
require 'active_support/core_ext/string/output_safety'
require 'babosa'
require 'rails'
require 'redcarpet'
require 'tilt'
require 'yaml'

require "semi_static/version"

module SemiStatic
  autoload :News, "semi_static/news"
  autoload :Article, "semi_static/article"
  autoload :Page, "semi_static/page"
  autoload :Backend, "semi_static/backend"
  autoload :TiltWrapper, "semi_static/tilt_wrapper"
  autoload :Controller, "semi_static/controller"

  class << self
    attr_writer :backend
    def backend
      @backend ||= Backend.new(Rails.root.join("semi_static_pages"))
    end
  end
end

require "semi_static/rails"
