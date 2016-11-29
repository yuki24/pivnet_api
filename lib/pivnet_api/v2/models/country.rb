class PivnetApi::V2::Country
  attr_reader :country, :states

  def initialize(country: nil, states: nil)
    @country = country
    @states = states
  end
end
