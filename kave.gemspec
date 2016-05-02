# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kave/version'

Gem::Specification.new do |spec|
  spec.name          = "kave"
  spec.version       = Kave::VERSION
  spec.authors       = ["mohammad mahmoudi"]
  spec.email         = ["mm580486@gmail.com"]

  spec.summary       = %q{Send SMS}
  spec.description   = %q{Send SMS by kavenegar services}
  spec.homepage      = "https://github.com/mm580486/kave"
  spec.license       = "mohammad mahmoudi"

  spec.add_dependency 'savon', ['~> 2.0']
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
