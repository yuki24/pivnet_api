class PivnetApi::V2::ProductFileSortOrderRequest
  attr_reader :product_files

  def initialize(product_files: nil)
    @product_files = product_files
  end
end
