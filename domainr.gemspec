# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'domainr/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'httparty', ">= 0.5.2"
  spec.add_dependency 'hashie', ">= 0.2.0"
  spec.add_dependency 'http', '~> 1.0'
  spec.add_dependency 'virtus', '~> 1.0'
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.author        = "Steve Agalloco"
  spec.description   = 'Ruby wrapper for the Domainr API'
  spec.email         = 'steve.agalloco@gmail.com'
  spec.files         = %w(LICENSE.md README.md domainr.gemspec) + Dir['lib/**/*.rb']
  spec.homepage      = 'https://github.com/stve/domainr'
  spec.licenses      = ['MIT']
  spec.name          = 'domainr'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.0.0'
  spec.summary       = 'Domainr API Ruby Client'
  spec.version       = Domainr::VERSION
end
