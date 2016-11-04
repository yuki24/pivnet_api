require "pivnet_api/version"

module PivnetApi
  ENDPOINT = "https://network.pivotal.io"

  module V2
    require 'pivnet_api/v2/client'

    def self.build(token, domain: ENDPOINT)
      client = PivnetApi::V2::Client.new(domain)
      client.register_interceptor(TokenProvider.new(token))
      client
    end

    class TokenProvider
      def initialize(token)
        @token = token
      end

      def before_request(uri, body, headers, options)
        headers["Authorization"] = "Token #{@token}"

        [uri, body, headers, options]
      end
    end

    private_constant :TokenProvider
  end
end
