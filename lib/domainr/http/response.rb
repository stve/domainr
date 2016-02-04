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
        @parsed_response ||= begin
          response.parse(:json)
        rescue
          response.body
        end
      end

      def fail_if_http_error
        return if response.status.ok?
      end

      def fail_if_body_contains_error
      end
    end
  end
end
