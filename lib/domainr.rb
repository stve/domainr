require 'hashie'
require 'httparty'

require 'domainr/version'

module Domainr
  extend self

  include HTTParty
  format :json
  base_uri 'domai.nr'

  def search(term)
    options = { :q => term }
    Hashie::Mash.new(get('/api/json/search', { :query => options }))
  end

  def info(domain)
    options = { :q => domain }
    Hashie::Mash.new(get('/api/json/info', { :query => options }))
  end

end
