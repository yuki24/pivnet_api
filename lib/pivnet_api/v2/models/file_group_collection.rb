class PivnetApi::V2::FileGroupCollection
  attr_reader :file_groups, :_links

  def initialize(file_groups: nil, _links: nil)
    @file_groups = file_groups
    @_links = _links
  end
end
