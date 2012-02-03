# encoding: UTF-8
require 'active_model/naming'
require 'active_model/conversion'

class SemiStatic::Page
  autoload :WithLocale, "semi_static/page/with_locale"

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  attr_accessor :title, :body
  attr_writer :slug

  def self.all
    SemiStatic.backend.all(self)
  end

  def self.first
    all.first
  end

  def self.find(param)
    param = CGI.unescape(param) if param =~ /%/
    all.find {|a| a.to_param == param }
  end

  def initialize(body, args)
    @body = body
    args.each_pair do |k,v|
      send("#{k}=", v)
    end
  end

  def to_param
    slug
  end

  def slug
    @slug || title.to_slug.normalize.to_s.gsub("！", "")
  end

  def to_s
    title.to_s
  end

  def render(source)
    body.render(source).html_safe
  end
end
