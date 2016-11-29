class PivnetApi::V2::DependencyCollection
  attr_reader :dependencies, :_links

  def initialize(dependencies: nil, _links: nil)
    @dependencies = dependencies
    @_links = _links
  end
end
