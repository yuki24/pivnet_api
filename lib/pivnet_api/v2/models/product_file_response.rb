class PivnetApi::V2::ProductFileResponse
  attr_reader :product_file

  def initialize(product_file: nil)
    @product_file = product_file
  end
end
