require 'hashie'
require 'httparty'

module Domainr
  extend self

  include HTTParty
  format :json
  base_uri 'domainr.com'

  def self.client_id=(id)
    @client_id = id
  end

  def self.client_id
    @client_id || 'domainr_rubygem'
  end

  def search(term)
    options = { :q => term, :client_id => client_id }
    Hashie::Mash.new(get('/api/json/search', { :query => options }))
  end

  def info(domain)
    options = { :q => domain, :client_id => client_id }
    Hashie::Mash.new(get('/api/json/info', { :query => options }))
  end

end
