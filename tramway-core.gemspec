$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tramway/core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tramway-core"
  s.version     = Tramway::Core::VERSION
  s.authors     = ["Pavel Kalashnikov"]
  s.email       = ["kalashnikovisme@gmail.com"]
  s.homepage    = "https://github.com/kalashnikovisme/tramway-core"
  s.summary     = "Core for all Tramway Rails Engines"
  s.description = "Core for all Tramway Rails Engines"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"
  s.add_dependency 'simple_form'
  s.add_dependency 'reform-rails'

  s.add_development_dependency 'pg'
end
