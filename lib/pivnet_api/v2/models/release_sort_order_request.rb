class PivnetApi::V2::ReleaseSortOrderRequest
  attr_reader :releases

  def initialize(releases: nil)
    @releases = releases
  end
end
