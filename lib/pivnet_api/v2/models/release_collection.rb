class PivnetApi::V2::ReleaseCollection
  attr_reader :releases, :_links

  def initialize(releases: nil, _links: nil)
    @releases = releases
    @_links = _links
  end
end
