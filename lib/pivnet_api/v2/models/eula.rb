class PivnetApi::V2::Eula
  attr_reader :id, :slug, :content, :name, :_links

  def initialize(id: nil, slug: nil, content: nil, name: nil, _links: nil)
    @id = id
    @slug = slug
    @content = content
    @name = name
    @_links = _links
  end
end
