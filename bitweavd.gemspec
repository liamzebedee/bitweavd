# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitweavd'

Gem::Specification.new do |spec|
  spec.name          = "bitweavd"
  spec.version       = BitWeavd::VERSION
  spec.authors       = ["Liam Edwards-Playne"]
  spec.email         = ["liamzebedee@yahoo.com.au"]
  spec.description   = %q{bitweavd is the premier proof-of-concept implementation of a client for the BitWeav protocol. BitWeav is a design for scalable and decentralised peer-to-peer micropublishing.}
  spec.summary       = %q{Daemon that implements the BitWeav protocol for scalable and decentralised peer-to-peer micropublishing}
  spec.homepage      = "http://bitweav.org"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
