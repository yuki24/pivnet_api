require 'json'

class PivnetAPI::Client
  class JsonSerializer
    APPLICATION_JSON     = 'application/json'.freeze
    JSON_REQUEST_HEADERS = {
      'Content-Type' => APPLICATION_JSON,
      'Accept'       => APPLICATION_JSON
    }.freeze

    def before_request(uri, body, headers, options)
      [uri, (body.nil? ? body : JSON.dump(body)), headers.merge(JSON_REQUEST_HEADERS), options]
    end
  end

  class JsonDeserializer
    def received_response(response)
      JSON.parse(response.body) if response.body
    end
  end

  private_constant :JsonSerializer, :JsonDeserializer
end