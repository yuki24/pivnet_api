class PivnetApi::V2::EulaAcceptance
  attr_reader :accepted_at, :_links

  def initialize(accepted_at: nil, _links: nil)
    @accepted_at = accepted_at
    @_links = _links
  end
end
