module Domainr
  class Error < StandardError
    # @return [Integer]
    attr_reader :code

    def self.from_response(error)
      new(error['message'], error['status'])
    end

    # Initializes a new Error object
    #
    # @param message [Exception, String]
    # @param code [Integer]
    # @return [Instapaper::Error]
    def initialize(message = '', code = nil)
      super(message)
      @code = code
    end
  end
end
