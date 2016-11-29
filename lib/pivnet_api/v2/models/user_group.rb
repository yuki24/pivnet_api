class PivnetApi::V2::UserGroup
  attr_reader :id, :name, :description, :members, :_links

  def initialize(id: nil, name: nil, description: nil, members: nil, _links: nil)
    @id = id
    @name = name
    @description = description
    @members = members
    @_links = _links
  end
end
