class PivnetApi::V2::UpgradePathCollection
  attr_reader :upgrade_paths, :_links

  def initialize(upgrade_paths: nil, _links: nil)
    @upgrade_paths = upgrade_paths
    @_links = _links
  end
end
