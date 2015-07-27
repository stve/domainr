require 'hashie'
require 'httparty'

module Domainr
  extend self

  include HTTParty
  format :json
  base_uri 'https://api.domainr.com'

  def self.client_id=(id)
    @client_id = id
  end

  def self.client_id
    @client_id || '{your-mashape-key}'
  end

  def search(term)
    options = { :q => term, :client_id => client_id }
    Hashie::Mash.new(get('/v1/search', { :query => options }))
  end

  def info(domain)
    options = { :q => domain, :client_id => client_id }
    Hashie::Mash.new(get('/v1/info', { :query => options }))
  end

end
