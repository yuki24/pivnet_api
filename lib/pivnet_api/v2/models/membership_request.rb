class PivnetApi::V2::MembershipRequest
  attr_reader :member

  def initialize(member: nil)
    @member = member
  end
end
