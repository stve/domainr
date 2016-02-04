module Domainr
  class Error < StandardError
    # @return [Integer]
    attr_reader :code
  end
end
