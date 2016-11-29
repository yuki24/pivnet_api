class PivnetApi::V2::DependencySpecifierResponse
  attr_reader :dependency_specifier

  def initialize(dependency_specifier: nil)
    @dependency_specifier = dependency_specifier
  end
end
