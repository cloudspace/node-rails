# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = "node-rails"
  spec.version       = NodeRails::VERSION
  spec.authors       = ["Dave Geffken"]
  spec.email         = ["dave@cloudspace.com"]
  spec.description   = %q{Gives you the ability to have a node server run along side your rails project}
  spec.summary       = %q{Gives you the ability to have a node server run along side your rails project}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 1.3"
  spec.add_dependency "rake"
  spec.add_dependency "backbone-rails", ">= 0.9.10"
  spec.add_dependency "socket.io-rails", ">= 0.9.16"
  spec.add_dependency "rails", ">= 3.2.0"
  spec.add_dependency "underscore-rails"
  spec.add_dependency "redis"
  
end
