# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oui/version'

Gem::Specification.new do |spec|
  spec.name          = "oui"
  spec.version       = OUI::VERSION
  spec.authors       = ["Forrest Ye"]
  spec.email         = ["afu@forresty.com"]
  spec.description   = %q{lookup OUI information /w Chinese translation using MAC address}
  spec.summary       = %q{lookup OUI information /w Chinese translation using MAC address}
  spec.homepage      = "https://github.com/modouwifi/oui-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
