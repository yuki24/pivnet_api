require 'test_helper'

class PivnetApiTest < Minitest::Test
  ENDPOINT  = ENV['PIVOTAL_NETWORK_API_ENDPOINT']
  API_TOKEN = ENV['PIVOTAL_NETWORK_API_TOKEN']

  def setup
    @client = PivnetApi::V2.build(API_TOKEN, domain: ENDPOINT)
  end

  def test_authentication
    response = @client.authentication

    assert_equal '200', response.code
  end

  def test_get_product
    response = @client.get_product('pivotal-cf')

    assert_equal '200',        response.code
    assert_equal 'pivotal-cf', response.json[:slug]
  end
end
