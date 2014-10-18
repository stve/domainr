require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'fakeweb'
require 'redgreen'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'domainr'

FakeWeb.allow_net_connect = false

FakeWeb.register_uri(:get, "https://domainr.com/api/json/info?q=domai.nr", :response => File.join(File.dirname(__FILE__), 'fixtures', 'info.json'), :content_type => "text/javascript+json; charset=utf-8", :status => ["200", "OK"])
FakeWeb.register_uri(:get, "https://domainr.com/api/json/info?q=d", :response => File.join(File.dirname(__FILE__), 'fixtures', 'empty_info.json'), :content_type => "text/javascript+json; charset=utf-8", :status => ["200", "OK"])
FakeWeb.register_uri(:get, "https://domainr.com/api/json/search?q=domainr", :response => File.join(File.dirname(__FILE__), 'fixtures', 'search.json'), :content_type => "text/javascript+json; charset=utf-8", :status => ["200", "OK"])
FakeWeb.register_uri(:get, "https://domainr.com/api/json/search?q=", :response => File.join(File.dirname(__FILE__), 'fixtures', 'empty_search.json'), :content_type => "text/javascript+json; charset=utf-8", :status => ["200", "OK"])
