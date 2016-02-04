require 'virtus'

module Domainr
  class Domain
    include Virtus.value_object

    attribute :domain, String
    attribute :host, String
    attribute :subdomain, String
    attribute :zone, String
    attribute :path, String
    attribute :register_url, String
    attribute :summary, String
  end
end
