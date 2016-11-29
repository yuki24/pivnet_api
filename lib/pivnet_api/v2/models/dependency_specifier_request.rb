class PivnetApi::V2::DependencySpecifierRequest
  attr_reader :dependency_specifier

  def initialize(dependency_specifier: nil)
    @dependency_specifier = dependency_specifier
  end
end
