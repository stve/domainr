# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'domainr/version'

Gem::Specification.new do |spec|
  spec.name          = 'domainr'
  spec.version       = Domainr::VERSION
  spec.homepage      = 'https://github.com/stve/domainr'

  spec.author        = "Steve Agalloco"
  spec.email         = 'steve.agalloco@gmail.com'
  spec.description   = 'Ruby wrapper for the Domainr API'
  spec.summary       = 'Ruby wrapper for the Domainr API'

  spec.licenses      = ['MIT']

  spec.executables   = Dir.glob("bin/**/*")
  spec.files         = %w(.yardopts LICENSE.md README.md Rakefile domainr.gemspec)
  spec.files         += Dir.glob("lib/**/*.rb")
  spec.files         += Dir.glob("spec/**/*")
  spec.test_files    = Dir.glob("spec/**/*")

  spec.add_dependency(%q<httparty>, [">= 0.5.2"])
  spec.add_dependency(%q<hashie>, [">= 0.2.0"])

  spec.require_paths = ['lib']
end
