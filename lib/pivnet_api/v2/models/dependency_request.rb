class PivnetApi::V2::DependencyRequest
  attr_reader :dependency

  def initialize(dependency: nil)
    @dependency = dependency
  end
end
