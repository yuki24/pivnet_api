class PivnetApi::V2::Release
  attr_reader :id, :version, :release_type, :release_date, :release_notes_url, :availability, :description, :eula, :end_of_support_date, :end_of_guidance_date, :end_of_availability_date, :eccn, :license_exception, :controlled, :updated_at, :software_files_updated_at, :_links

  def initialize(id: nil, version: nil, release_type: nil, release_date: nil, release_notes_url: nil, availability: nil, description: nil, eula: nil, end_of_support_date: nil, end_of_guidance_date: nil, end_of_availability_date: nil, eccn: nil, license_exception: nil, controlled: nil, updated_at: nil, software_files_updated_at: nil, _links: nil)
    @id = id
    @version = version
    @release_type = release_type
    @release_date = release_date
    @release_notes_url = release_notes_url
    @availability = availability
    @description = description
    @eula = eula
    @end_of_support_date = end_of_support_date
    @end_of_guidance_date = end_of_guidance_date
    @end_of_availability_date = end_of_availability_date
    @eccn = eccn
    @license_exception = license_exception
    @controlled = controlled
    @updated_at = updated_at
    @software_files_updated_at = software_files_updated_at
    @_links = _links
  end
end
