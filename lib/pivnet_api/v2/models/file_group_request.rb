class PivnetApi::V2::FileGroupRequest
  attr_reader :file_group

  def initialize(file_group: nil)
    @file_group = file_group
  end
end
