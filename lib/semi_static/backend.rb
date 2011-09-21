class SemiStatic::Backend < SemiStatic::Page

  def initialize(root)
    @root = root
    @cache = {}
  end

  def all(page_type)
    if !@cache.key?(page_type) || !Rails.application.config.cache_classes
      path = File.join(@root,ActiveModel::Naming.plural(page_type), "*")
      @cache[page_type] = Dir.glob(path).map do |f|
        yaml, body = File.read(f).split("\n...\n", 2)
        h = YAML.load(yaml)
        template = Tilt.new(f) {|template| body }
        page_type.new(template, h)
      end
    end
    @cache[page_type]
  end
end
