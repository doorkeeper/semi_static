module ActionDispatch::Routing
  class Mapper
    def semi_static_for(resource, args = {})
      resource_as_class = resource.to_s.classify.constantize
      c = lambda {|r| r.env["semi_static.mapping"] = resource_as_class ; true }
      defaults = { :only => [ :index, :show ]}
      if resource_as_class < SemiStatic::News
        defaults[:id] = /([0-9]+\/){3}.+/
        defaults[:controller] = "semi_static/news"
      else
        defaults[:controller] = "semi_static/page"
      end
      constraints(c) { resources(resource, defaults.merge(args)) }
    end
  end
end
