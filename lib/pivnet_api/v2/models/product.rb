class PivnetApi::V2::Product
  attr_reader :id, :slug, :name, :logo_url, :availability, :category, :description, :feature_list, :docs_url, :_links

  def initialize(id: nil, slug: nil, name: nil, logo_url: nil, availability: nil, category: nil, description: nil, feature_list: nil, docs_url: nil, _links: nil)
    @id = id
    @slug = slug
    @name = name
    @logo_url = logo_url
    @availability = availability
    @category = category
    @description = description
    @feature_list = feature_list
    @docs_url = docs_url
    @_links = _links
  end
end
