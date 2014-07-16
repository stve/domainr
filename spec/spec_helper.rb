# encoding: utf-8
unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_group 'Domainr', 'lib/domainr'
    add_group 'Specs', 'spec'
  end
end

require 'fakeweb'
require 'domainr'

FakeWeb.allow_net_connect = false

FakeWeb.register_uri(:get, "http://domai.nr/api/json/info?q=domai.nr&client_id=ruby_spagalloco", :response => File.join(File.dirname(__FILE__), 'fixtures', 'info.json'), :content_type => "text/javascript+json; charset=utf-8", :status => ["200", "OK"])
FakeWeb.register_uri(:get, "http://domai.nr/api/json/info?q=d&client_id=ruby_spagalloco", :response => File.join(File.dirname(__FILE__), 'fixtures', 'empty_info.json'), :content_type => "text/javascript+json; charset=utf-8", :status => ["200", "OK"])
FakeWeb.register_uri(:get, "http://domai.nr/api/json/search?q=domainr&client_id=ruby_spagalloco", :response => File.join(File.dirname(__FILE__), 'fixtures', 'search.json'), :content_type => "text/javascript+json; charset=utf-8", :status => ["200", "OK"])
FakeWeb.register_uri(:get, "http://domai.nr/api/json/search?q=&client_id=ruby_spagalloco", :response => File.join(File.dirname(__FILE__), 'fixtures', 'empty_search.json'), :content_type => "text/javascript+json; charset=utf-8", :status => ["200", "OK"])

RSpec.configure do |config|
  config.order = :random
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
end
