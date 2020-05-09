$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "bongo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "bongo"
  spec.version     = Bongo::VERSION
  spec.authors     = ["Thomas Hutterer"]
  spec.email       = ["tohu@tuta.io"]
  spec.homepage    = "https://rubygems.org/gems/bongo"
  spec.summary     = "A blogging engine"
  spec.description = "Bongo is a mountable Rails engine for blogging using MongoDB."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_runtime_dependency "rails", "~> 6.0.3"
  spec.add_runtime_dependency "mongoid", "~> 7.0.5"
end
