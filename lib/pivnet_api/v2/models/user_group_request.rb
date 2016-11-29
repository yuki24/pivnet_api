class PivnetApi::V2::UserGroupRequest
  attr_reader :user_group

  def initialize(user_group: nil)
    @user_group = user_group
  end
end
