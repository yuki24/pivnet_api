require "pivnet_api/version"
require 'pivnet_api/client'

module PivnetAPI
  ENDPOINT = "https://network.pivotal.io"

  def self.build(token)
    ClientWrapper.new(token)
  end

  class ClientWrapper < SimpleDelegator
    def initialize(token, domain: ENDPOINT)
      client = PivnetAPI::Client.new(domain)
      client.register_interceptor(TokenProvider.new(token))

      super(client)
    end
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

  private_constant :ClientWrapper, :TokenProvider
end
