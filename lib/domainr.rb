require 'hashie'
require 'httparty'

require 'domainr/version'

module Domainr
  extend self

  include HTTParty
  format :json
  base_uri 'domainr.com'

  def search(term)
    options = { :q => term, :client_id => 'ruby_spagalloco' }
    Hashie::Mash.new(get('/api/json/search', { :query => options }))
  end

  def info(domain)
    options = { :q => domain, :client_id => 'ruby_spagalloco' }
    Hashie::Mash.new(get('/api/json/info', { :query => options }))
  end

end
