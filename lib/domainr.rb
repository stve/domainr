require 'hashie'
require 'httparty'

module Domainr
  include HTTParty
  format :json
  base_uri 'https://api.domainr.com'

  def self.client_id=(id)
    @client_id = id
  end

  def self.client_id
    @client_id || 'domainr_rubygem'
  end

  def self.search(term)
    options = {q: term, client_id: client_id}
    Hashie::Mash.new(get('/v1/search', query: options))
  end

  def self.info(domain)
    options = {q: domain, client_id: client_id}
    Hashie::Mash.new(get('/v1/info', query: options))
  end
end
