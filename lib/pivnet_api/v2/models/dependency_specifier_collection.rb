class PivnetApi::V2::DependencySpecifierCollection
  attr_reader :dependency_specifiers

  def initialize(dependency_specifiers: nil)
    @dependency_specifiers = dependency_specifiers
  end
end
