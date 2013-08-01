# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitweavd'

Gem::Specification.new do |s|
  s.name          = "bitweavd"
  s.version       = BitWeavd::VERSION
  s.authors       = ["Liam Edwards-Playne"]
  s.email         = ["liamzebedee@yahoo.com.au"]
  s.description   = %q{bitweavd is the premier proof-of-concept implementation of a client for the BitWeav protocol. BitWeav is a design for scalable and decentralised peer-to-peer micropublishing.}
  s.summary       = %q{Daemon that implements the BitWeav protocol for scalable and decentralised peer-to-peer micropublishing}
  s.homepage      = "http://bitweav.org"
  s.license       = "MIT"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|s|features)/})
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
  s.add_runtime_dependency "rpcjson", ">= 0.0.2"
end
