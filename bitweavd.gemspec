# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitweavd-info'

Gem::Specification.new do |s|
  s.name          = "bitweavd"
  s.version       = BitWeavD::VERSION
  s.authors       = ["Liam Edwards-Playne"]
  s.email         = ["liamzebedee@yahoo.com.au"]
  s.description   = %q{bitweavd is the premier proof-of-concept implementation of a client for the BitWeav protocol. BitWeav is a design for scalable and decentralised peer-to-peer micropublishing.}
  s.summary       = BitWeavD::SUMMARY
  s.homepage      = "http://bitweav.org"
  s.license       = "MIT"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|s|features)/})
  s.require_paths = ["lib"]
  
  # Dependencies.
  s.add_runtime_dependency "commander", "~> 4.1.4"
  s.add_runtime_dependency "toml-rb", "~> 0.1.3"

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"  
end
