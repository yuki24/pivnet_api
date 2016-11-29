class PivnetApi::V2::ProdeuctFileCollection
  attr_reader :product_files, :_links

  def initialize(product_files: nil, _links: nil)
    @product_files = product_files
    @_links = _links
  end
end
