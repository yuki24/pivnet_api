class PivnetApi::V2::ReleaseTypes
  attr_reader :status, :release_types, :_links

  def initialize(status: nil, release_types: nil, _links: nil)
    @status = status
    @release_types = release_types
    @_links = _links
  end
end
