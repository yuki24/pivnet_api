class PivnetApi::V2::ProductCollection
  attr_reader :products, :_links

  def initialize(products: nil, _links: nil)
    @products = products
    @_links = _links
  end
end
