class PivnetApi::V2::UpgradePathRequest
  attr_reader :upgrade_path

  def initialize(upgrade_path: nil)
    @upgrade_path = upgrade_path
  end
end
