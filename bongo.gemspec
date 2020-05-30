$:.push File.expand_path("lib", __dir__)

require "bongo/version"

Gem::Specification.new do |spec|
  spec.name        = "bongo"
  spec.version     = Bongo::VERSION
  spec.authors     = ["Thomas Hutterer"]
  spec.email       = ["tohu@tuta.io"]
  spec.homepage    = "https://github.com/thutterer/bongo"
  spec.summary     = "A blogging engine for Rails"
  spec.description = "Rails engine for blogging using MongoDB."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_runtime_dependency "rails", "~> 6.0.3"
  spec.add_runtime_dependency "mongoid", "~> 7.0.5"
  spec.add_runtime_dependency "aws-sdk-s3", "~> 1"
  spec.add_runtime_dependency "pundit", "~> 2.1"
end
