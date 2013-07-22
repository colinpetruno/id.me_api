# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'idme/version'


Gem::Specification.new do |spec|
  spec.name          = "IdMe"
  spec.version       = IdMe::VERSION
  spec.authors       = ["Colin Petruno"]
  spec.email         = ["colinpetruno@gmail.com"]
  spec.description   = %q{Gem For ID ME API}
  spec.summary       = %q{Easily connect and call methods for ID ME API}
  spec.homepage      = "http://www.rallypoint.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "json"
  spec.add_development_dependency "rspec"
  spec.add_dependency "httparty"
end
