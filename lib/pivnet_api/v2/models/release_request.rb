class PivnetApi::V2::ReleaseRequest
  attr_reader :release

  def initialize(release: nil)
    @release = release
  end
end
