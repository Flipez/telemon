# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'telemon/version'

Gem::Specification.new do |spec|
  spec.name          = "telemon"
  spec.version       = Telemon::VERSION
  spec.authors       = ["Flipez"]
  spec.email         = ["github@flipez.net"]

  spec.summary       = %q{t summary, because Rubygems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/Flipez"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
