# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pretty_diffs/version'

Gem::Specification.new do |spec|
  spec.name          = "pretty-diffs"
  spec.version       = PrettyDiffs::VERSION
  spec.authors       = ["Angelos Karagkiozidis"]
  spec.email         = ["angelkar@gmail.com"]

  spec.summary       = %q{Enable colored diffs in minitest.}
  spec.description   = %q{A simple ruby module to enable conventiently colored diffs in your minitest suite.}
  spec.homepage      = "https://github.com/angelkar/pretty-diffs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
