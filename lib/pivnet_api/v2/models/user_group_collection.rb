class PivnetApi::V2::UserGroupCollection
  attr_reader :user_groups, :_links

  def initialize(user_groups: nil, _links: nil)
    @user_groups = user_groups
    @_links = _links
  end
end
