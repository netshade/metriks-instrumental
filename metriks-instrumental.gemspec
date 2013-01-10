# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'metriks-instrumental/version'

Gem::Specification.new do |gem|
  gem.name          = "metriks-instrumental"
  gem.version       = Metriks::Instrumental::VERSION
  gem.authors       = ["Chris Zelenak"]
  gem.email         = ["chris@fastestforward.com"]
  gem.description   = %q{A Metriks reporter that submits to Instrumental}
  gem.summary       = %q{A Metriks reporter that submits to Instrumental}
  gem.homepage      = "http://github.com/netshade/metriks-instrumental"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("metriks", ["~> 0.9.9"])
  gem.add_dependency("instrumental_agent", ["~> 0.12"])
  gem.add_development_dependency("rake", ["~> 10"])
  gem.add_development_dependency("mocha", ["~> 0.10"])


end
