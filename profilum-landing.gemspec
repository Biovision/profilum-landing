$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "profilum/landing/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "profilum-landing"
  s.version     = Profilum::Landing::VERSION
  s.authors     = ["Maxim Khan-Magomedov"]
  s.email       = ["maxim.km@gmail.com"]
  s.homepage    = "https://github.com/Biovision/profilum-landing"
  s.summary     = "Basic landing page for Profilum projects"
  s.description = "Basic landing page for Profilum projects: courses, prices, etc."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1"
  s.add_dependency 'biovision-base'

  s.add_development_dependency "pg"
end
