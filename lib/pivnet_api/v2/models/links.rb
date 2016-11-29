class PivnetApi::V2::Links
  attr_reader :self, :eula, :releases, :product_files, :file_groups

  def initialize(self: nil, eula: nil, releases: nil, product_files: nil, file_groups: nil)
    @self = self
    @eula = eula
    @releases = releases
    @product_files = product_files
    @file_groups = file_groups
  end
end
