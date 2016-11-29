class PivnetApi::V2::FileGroup
  attr_reader :id, :name, :product, :product_files, :_links

  def initialize(id: nil, name: nil, product: nil, product_files: nil, _links: nil)
    @id = id
    @name = name
    @product = product
    @product_files = product_files
    @_links = _links
  end
end
