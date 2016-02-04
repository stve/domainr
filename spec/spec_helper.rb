# encoding: utf-8
unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter '/spec/'
  end
end

require 'domainr'
require 'rspec'
require 'webmock/rspec'

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def stub_get(path, endpoint = Domainr::Client::DEFAULT_ENDPOINT)
  stub_request(:get, endpoint + path)
end

def a_get(path, endpoint = Domainr::Client::DEFAULT_ENDPOINT)
  a_request(:get, endpoint + path)
end

RSpec.configure do |config|
  config.order = :random
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
end
