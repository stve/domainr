require 'http'
require 'domainr/domain'
require 'domainr/http/response'

module Domainr
  class Client
    DEFAULT_ENDPOINT = 'https://domainr.p.mashape.com'

    attr_accessor :client_id, :mashape_key, :endpoint

    def initialize(options = {})
      @client_id = options.delete(:client_id)
      @mashape_key = options.delete(:mashape_key)
      @endpoint = options.delete(:endpoint) || DEFAULT_ENDPOINT
    end

    def search(query, options = {})
      perform_get_with_objects('/v2/search', options.merge(query: query), 'results', Domainr::Domain)
    end

    def status(domain, options = {})
      perform_get_with_objects('/v2/status', options.merge(domain: domain), 'status', Domainr::Domain)
    end

    private

    # @param path [String]
    # @param options [Hash]
    # @param response_path [String]
    # @param klass [Class]
    def perform_get_with_objects(path, options, response_path, klass)
      perform_request(path, options)[response_path].collect do |element|
        klass.new(element)
      end
    end

    def perform_request(path, params)
      response = ::HTTP.headers(accept: 'application/json')
                       .get(endpoint + path, params: params.merge(authentication_params))

      resp = Domainr::HTTP::Response.new(response)
      resp.valid? && resp.body
    end

    def authentication_params
      if mashape_key
        {'mashape-key' => mashape_key}
      elsif client_id
        {'client_id' => client_id}
      else
        {}
      end
    end
  end
end
