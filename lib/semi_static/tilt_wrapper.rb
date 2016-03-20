class SemiStatic::TiltWrapper
  class << self
    def template(filename, body)
      t = Tilt.new(filename, nil, :renderer => Redcarpet::Render::HTML.new(:hard_wrap => true)) {|t| body }
      wrap t
    end

    private

    def wrap(template)
      components = File.basename(template.file).split(".")
      if components.size > 2
        filename = template.file.chomp('.' + components.last)
        wrap new(template, filename)
      else
        template
      end
    end
  end

  attr_reader :file

  def initialize(wrapping_template, filename)
    @wrapping_template, @file = wrapping_template, filename
  end

  def render(scope=Object.new, locals={}, &block)
    template = Tilt.new(@file) {|t| @wrapping_template.render(scope, locals, &block) }
    template.render(scope, locals, &block)
  end
end
