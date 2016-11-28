# frozen-string-literal: true
require 'net/http'
require 'pivnet_api/v2/exceptions'
require 'pivnet_api/v2/json_handler'

class PivnetApi::V2::Client
  attr_reader :domain, :proxy_addr, :proxy_port, :proxy_user, :proxy_password

  def initialize(domain, proxy_addr: nil, proxy_port: nil, proxy_user: nil, proxy_password: nil)
    @domain = domain
    @proxy_addr = proxy_addr
    @proxy_port = proxy_port
    @proxy_user = proxy_user
    @proxy_password = proxy_password
    @interceptors = []
    @observers = []

    register_interceptor(JsonSerializer.new)
    register_observer(ResponseHandler.new)
    register_observer(JsonDeserializer.new)
  end

  def register_interceptor(interceptor)
    @interceptors << interceptor
  end

  def register_observer(observer)
    @observers << observer
  end

  def authentication(query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri('/api/v2/authentication', query), nil, headers, options)
  end

  def get_products(query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri('/api/v2/products', query), nil, headers, options)
  end
  alias find_products get_products

  def get_product(slug, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}", query), nil, headers, options)
  end
  alias find_product get_product

  def sort_release_in_product(slug, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/release_sort_order", query), body, headers, options)
  end

  def get_eulas(query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri('/api/v2/eulas', query), nil, headers, options)
  end
  alias find_eulas get_eulas

  def get_eula(id, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/eulas/#{id}", query), nil, headers, options)
  end
  alias find_eula get_eula

  def accept_eula(slug, release_id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/products/#{slug}/releases/#{release_id}/eula_acceptance", query), body, headers, options)
  end

  def get_user_groups(query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri('/api/v2/user_groups', query), nil, headers, options)
  end
  alias find_user_groups get_user_groups

  def get_user_group(id, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/user_groups/#{id}", query), nil, headers, options)
  end
  alias find_user_group get_user_group

  def post_user_group(body, query: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri('/api/v2/user_groups', query), body, headers, options)
  end
  alias create_user_group post_user_group

  def patch_user_group(id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/user_groups/#{id}", query), body, headers, options)
  end
  alias update_user_group patch_user_group

  def delete_user_group(id, query: {}, headers: {}, **options)
    request(Net::HTTP::Delete, uri("/api/v2/user_groups/#{id}", query), nil, headers, options)
  end
  alias destroy_user_group delete_user_group

  def add_member_to_group(id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/user_groups/#{id}/add_member", query), body, headers, options)
  end

  def remove_member_from_group(id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/user_groups/#{id}/remove_member", query), body, headers, options)
  end

  def get_product_files(slug, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/product_files", query), nil, headers, options)
  end
  alias find_product_files get_product_files

  def get_product_file(slug, id, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/product_files/#{id}", query), nil, headers, options)
  end
  alias find_product_file get_product_file

  def post_product_file(slug, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/products/#{slug}/product_files", query), body, headers, options)
  end
  alias create_product_file post_product_file

  def patch_product_file(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/product_files/#{id}", query), body, headers, options)
  end
  alias update_product_file patch_product_file

  def delete_product_file(slug, id, query: {}, headers: {}, **options)
    request(Net::HTTP::Delete, uri("/api/v2/products/#{slug}/product_files/#{id}", query), nil, headers, options)
  end
  alias destroy_product_file delete_product_file

  def retry_file_transfer(slug, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/product_files/retry_all", query), body, headers, options)
  end

  def post_download(slug, release_id, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/products/#{slug}/releases/#{release_id}/product_files/#{id}/download", query), body, headers, options)
  end
  alias create_download post_download

  def post_signature_download(slug, release_id, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/products/#{slug}/releases/#{release_id}/product_files/#{id}/signature_file_download", query), body, headers, options)
  end
  alias create_signature_download post_signature_download

  def get_file_groups(slug, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/file_groups", query), nil, headers, options)
  end
  alias find_file_groups get_file_groups

  def get_file_group(slug, id, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/file_groups/#{id}", query), nil, headers, options)
  end
  alias find_file_group get_file_group

  def post_file_group(slug, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/products/#{slug}/file_groups", query), body, headers, options)
  end
  alias create_file_group post_file_group

  def patch_file_group(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/file_groups/#{id}", query), body, headers, options)
  end
  alias update_file_group patch_file_group

  def delete_file_group(slug, id, query: {}, headers: {}, **options)
    request(Net::HTTP::Delete, uri("/api/v2/products/#{slug}/file_groups/#{id}", query), nil, headers, options)
  end
  alias destroy_file_group delete_file_group

  def add_file_to_group(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/file_groups/#{id}/add_product_file", query), body, headers, options)
  end

  def remove_file_from_group(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/file_groups/#{id}/remove_product_file", query), body, headers, options)
  end

  def sort_file_in_group(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/file_groups/#{id}/product_file_sort_order", query), body, headers, options)
  end

  def get_releases(slug, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/releases", query), nil, headers, options)
  end
  alias find_releases get_releases

  def get_release(slug, id, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/releases/#{id}", query), nil, headers, options)
  end
  alias find_release get_release

  def post_release(slug, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/products/#{slug}/releases", query), body, headers, options)
  end
  alias create_release post_release

  def patch_release(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{id}", query), body, headers, options)
  end
  alias update_release patch_release

  def delete_release(slug, id, query: {}, headers: {}, **options)
    request(Net::HTTP::Delete, uri("/api/v2/products/#{slug}/releases/#{id}", query), nil, headers, options)
  end
  alias destroy_release delete_release

  def get_release_files(slug, release_id, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/releases/#{release_id}/product_files", query), nil, headers, options)
  end
  alias find_release_files get_release_files

  def get_release_file(slug, release_id, id, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/releases/#{release_id}/product_files/#{id}", query), nil, headers, options)
  end
  alias find_release_file get_release_file

  def add_file_to_release(slug, release_id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{release_id}/add_product_file", query), body, headers, options)
  end

  def remove_file_from_release(slug, release_id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{release_id}/remove_product_file", query), body, headers, options)
  end

  def sort_file_in_release(slug, release_id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{release_id}/product_file_sort_order", query), body, headers, options)
  end

  def get_release_file_groups(slug, id, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/releases/#{id}/file_groups", query), nil, headers, options)
  end
  alias find_release_file_groups get_release_file_groups

  def add_file_group_to_release(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{id}/add_file_group", query), body, headers, options)
  end

  def remove_file_group_from_release(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{id}/remove_file_group", query), body, headers, options)
  end

  def sort_file_group_in_release(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{id}/file_group_sort_order", query), body, headers, options)
  end

  def get_release_user_groups(slug, id, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/releases/#{id}/user_groups", query), nil, headers, options)
  end
  alias find_release_user_groups get_release_user_groups

  def add_user_group_to_release(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{id}/add_user_group", query), body, headers, options)
  end

  def remove_user_group_from_release(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{id}/remove_user_group", query), body, headers, options)
  end

  def get_release_dependencies(slug, id, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/releases/#{id}/dependenciess", query), nil, headers, options)
  end
  alias find_release_dependencies get_release_dependencies

  def add_dependency(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{id}/add_dependency", query), body, headers, options)
  end

  def remove_dependency(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{id}/remove_dependency", query), body, headers, options)
  end

  def get_release_upgrade_paths(slug, id, query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/releases/#{id}/upgrade_paths", query), nil, headers, options)
  end
  alias find_release_upgrade_paths get_release_upgrade_paths

  def add_upgrade_path(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{id}/add_upgrade_path", query), body, headers, options)
  end

  def remove_upgrade_path(slug, id, body, query: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{id}/remove_upgrade_path", query), body, headers, options)
  end

  def get_countries_states(query: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri('/api/v2/users/countries_states', query), nil, headers, options)
  end
  alias find_countries_states get_countries_states

  private

  DEFAULT_OPTIONS = {
    ca_file: nil,
    ca_path: nil,
    cert: nil,
    cert_store: nil,
    ciphers: nil,
    close_on_empty_response: nil,
    key: nil,
    open_timeout: nil,
    read_timeout: nil,
    ssl_timeout: nil,
    ssl_version: nil,
    use_ssl: nil,
    verify_callback: nil,
    verify_depth: nil,
    verify_mode: nil
  }.freeze

  HTTPS = 'https'.freeze

  def request(request_class, uri, body, headers, options = {})
    uri, body, headers, options = @interceptors.reduce([uri, body, headers, DEFAULT_OPTIONS.merge(options)]) { |r, i| i.before_request(*r) }

    begin
      response = Net::HTTP.start(uri.host, uri.port, proxy_addr, proxy_port, proxy_user, proxy_password, options, use_ssl: (uri.scheme == HTTPS)) do |http|
        http.request request_class.new(uri, headers), body
      end
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
      raise NetworkError, "A network error occurred: #{e.class} (#{e.message})"
    end

    @observers.reduce(response) { |r, o| o.received_response(r) }
  end

  def uri(path, query = {})
    uri = URI.join(domain, path)
    uri.query = URI.encode_www_form(query) unless query.empty?
    uri
  end
end
