class SemiStatic::Page
  autoload :WithLocale, "semi_static/page/with_locale"

  extend ActiveModel::Naming
  attr_accessor :title, :body

  def self.all
    SemiStatic.backend.all(self)
  end

  def self.first
    all.first
  end

  def self.find(param)
    all.find {|a| a.to_param == param }
  end

  def initialize(body, args)
    @body = body
    args.each_pair do |k,v|
      send("#{k}=", v)
    end
  end

  def to_param
    title.to_slug.normalize.to_s
  end

  def to_s
    title.to_s
  end

end
