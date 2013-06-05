# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "semi_static/version"

Gem::Specification.new do |s|
  s.name        = "semi_static"
  s.version     = SemiStatic::VERSION
  s.authors     = ["Paul McMahon"]
  s.email       = ["paul@mobalean.com"]
  s.homepage    = "http://www.mobalean.com"
  s.summary     = %q{Text file based CMS for Rails}
  s.description = %q{Easily create content for your Rails apps using just textfiles}

  s.rubyforge_project = "semi_static"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'rails', '> 3.0'
  s.add_dependency 'redcarpet'
  s.add_dependency 'babosa'
  s.add_dependency 'tilt'

  s.add_development_dependency 'rspec-rails', '~> 2.0'
  s.add_development_dependency 'capybara', '~> 2.1'
end
