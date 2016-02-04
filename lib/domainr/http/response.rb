require 'domainr/error'

module Domainr
  module HTTP
    class Response
      attr_reader :response

      def initialize(response)
        @response = response
      end

      def valid?
        !error?
      end

      def error?
        fail_if_body_contains_error
        fail_if_http_error
      end

      def body
        parsed
      end

      private

      def parsed
        response.parse(:json)
      end

      def fail_if_http_error
        return if response.status.ok?

        fail Domainr::Error.new(response.status.reason, response.status.code)
      end

      def fail_if_body_contains_error
        if parsed.key?('error')
          fail Domainr::Error.from_response(parsed['error'])
        end
      end
    end
  end
end
