class PivnetApi::V2::EulaCollection
  attr_reader :eulas, :_links

  def initialize(eulas: nil, _links: nil)
    @eulas = eulas
    @_links = _links
  end
end
