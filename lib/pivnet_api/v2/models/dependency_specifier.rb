class PivnetApi::V2::DependencySpecifier
  attr_reader :id, :product, :specifier, :_links

  def initialize(id: nil, product: nil, specifier: nil, _links: nil)
    @id = id
    @product = product
    @specifier = specifier
    @_links = _links
  end
end
