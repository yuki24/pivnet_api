class PivnetApi::V2::Member
  attr_reader :email, :admin

  def initialize(email: nil, admin: nil)
    @email = email
    @admin = admin
  end
end
