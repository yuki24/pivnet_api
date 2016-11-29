class PivnetApi::V2::UpgradePath
  attr_reader :release

  def initialize(release: nil)
    @release = release
  end
end
