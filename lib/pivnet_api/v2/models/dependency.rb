class PivnetApi::V2::Dependency
  attr_reader :release

  def initialize(release: nil)
    @release = release
  end
end
