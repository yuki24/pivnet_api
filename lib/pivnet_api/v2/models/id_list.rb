class PivnetApi::V2::IdList
  attr_reader :ids

  def initialize(ids: nil)
    @ids = ids
  end
end
