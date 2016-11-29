class PivnetApi::V2::ProductFile
  attr_reader :id, :aws_object_key, :description, :docs_url, :file_transfer_status, :file_type, :file_version, :has_signature_file, :included_files, :md5, :name, :platforms, :ready_to_serve, :released_at, :size, :system_requirements, :_links

  def initialize(id: nil, aws_object_key: nil, description: nil, docs_url: nil, file_transfer_status: nil, file_type: nil, file_version: nil, has_signature_file: nil, included_files: nil, md5: nil, name: nil, platforms: nil, ready_to_serve: nil, released_at: nil, size: nil, system_requirements: nil, _links: nil)
    @id = id
    @aws_object_key = aws_object_key
    @description = description
    @docs_url = docs_url
    @file_transfer_status = file_transfer_status
    @file_type = file_type
    @file_version = file_version
    @has_signature_file = has_signature_file
    @included_files = included_files
    @md5 = md5
    @name = name
    @platforms = platforms
    @ready_to_serve = ready_to_serve
    @released_at = released_at
    @size = size
    @system_requirements = system_requirements
    @_links = _links
  end
end
