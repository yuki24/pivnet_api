# -*- frozen-string-literal: true -*-
require 'net/http'

class PivnetAPI::Client
  attr_reader :domain, :proxy_addr, :proxy_port, :proxy_user, :proxy_password

  def initialize(domain, proxy_addr: nil, proxy_port: nil, proxy_user: nil, proxy_password: nil)
    @domain, @proxy_addr, @proxy_port, @proxy_user, @proxy_password =
      domain, proxy_addr, proxy_port, proxy_user, proxy_password

    @interceptors = [JsonCallback.new]
    @observers    = [JsonCallback.new]
  end

  def register_interceptor(interceptor)
    @interceptors << interceptor
  end

  def register_observer(observer)
    @observers << observer
  end
  
  def get_authentication(query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/authentication", query_params), nil, headers, options)
  end
  
  def get_products(query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products", query_params), nil, headers, options)
  end
  
  def get_product(slug, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}", query_params), nil, headers, options)
  end
  
  def patch_release_sort_order(slug, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/release_sort_order", query_params), body, headers, options)
  end
  
  def get_eulas(query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/eulas", query_params), nil, headers, options)
  end
  
  def get_eula(id, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/eulas/#{id}", query_params), nil, headers, options)
  end
  
  def post_eula_acceptance(slug, release_id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/products/#{slug}/releases/#{release_id}/eula_acceptance", query_params), body, headers, options)
  end
  
  def get_user_groups(query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/user_groups", query_params), nil, headers, options)
  end
  
  def get_user_group(id, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/user_groups/#{id}", query_params), nil, headers, options)
  end
  
  def post_user_group(body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/user_groups", query_params), body, headers, options)
  end
  
  def patch_user_group(id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/user_groups/#{id}", query_params), body, headers, options)
  end
  
  def delete_user_group(id, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Delete, uri("/api/v2/user_groups/#{id}", query_params), nil, headers, options)
  end
  
  def patch_add_member(id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/user_groups/#{id}/add_member", query_params), body, headers, options)
  end
  
  def patch_remove_member(id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/user_groups/#{id}/remove_member", query_params), body, headers, options)
  end
  
  def get_product_files(slug, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/product_files", query_params), nil, headers, options)
  end
  
  def get_product_file(slug, id, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/product_files/#{id}", query_params), nil, headers, options)
  end
  
  def post_product_file(slug, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/products/#{slug}/product_files", query_params), body, headers, options)
  end
  
  def patch_product_file(slug, id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/product_files/#{id}", query_params), body, headers, options)
  end
  
  def delete_product_file(slug, id, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Delete, uri("/api/v2/products/#{slug}/product_files/#{id}", query_params), nil, headers, options)
  end
  
  def patch_file_transfers(slug, id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/product_files/retry_all", query_params), body, headers, options)
  end
  
  def post_download(slug, release_id, id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/products/#{slug}/releases/#{release_id}/product_files/#{id}/download", query_params), body, headers, options)
  end
  
  def post_signature_download(slug, release_id, id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/products/#{slug}/releases/#{release_id}/product_files/#{id}/signature_file_download", query_params), body, headers, options)
  end
  
  def get_file_groups(slug, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/file_groups", query_params), nil, headers, options)
  end
  
  def get_file_group(slug, id, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/file_groups/#{id}", query_params), nil, headers, options)
  end
  
  def post_file_group(slug, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/products/#{slug}/file_groups", query_params), body, headers, options)
  end
  
  def patch_file_group(slug, id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/file_groups/#{id}", query_params), body, headers, options)
  end
  
  def delete_file_group(slug, id, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Delete, uri("/api/v2/products/#{slug}/file_groups/#{id}", query_params), nil, headers, options)
  end
  
  def patch_add_product_file(slug, id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/file_groups/#{id}/add_product_file", query_params), body, headers, options)
  end
  
  def delete_remove_product_file(slug, id, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Delete, uri("/api/v2/products/#{slug}/file_groups/#{id}/remove_product_file", query_params), nil, headers, options)
  end
  
  def patch_file_sort_order(slug, id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/file_groups/#{id}/product_file_sort_order", query_params), body, headers, options)
  end
  
  def get_releases(slug, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/releases", query_params), nil, headers, options)
  end
  
  def get_release(slug, id, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/releases/#{id}", query_params), nil, headers, options)
  end
  
  def post_release(slug, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/products/#{slug}/releases", query_params), body, headers, options)
  end
  
  def patch_release(slug, id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{id}", query_params), body, headers, options)
  end
  
  def delete_release(slug, id, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Delete, uri("/api/v2/products/#{slug}/releases/#{id}", query_params), nil, headers, options)
  end
  
  def get_release_files(slug, release_id, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/releases/#{release_id}/release_files", query_params), nil, headers, options)
  end
  
  def get_release_file(slug, release_id, id, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Get, uri("/api/v2/products/#{slug}/releases/#{release_id}/release_files/#{id}", query_params), nil, headers, options)
  end
  
  def post_release_file(slug, release_id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Post, uri("/api/v2/products/#{slug}/releases/#{release_id}/release_files", query_params), body, headers, options)
  end
  
  def patch_release_file(slug, release_id, id, body, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Patch, uri("/api/v2/products/#{slug}/releases/#{release_id}/release_files/#{id}", query_params), body, headers, options)
  end
  
  def delete_release_file(slug, release_id, id, query_params: {}, headers: {}, **options)
    request(Net::HTTP::Delete, uri("/api/v2/products/#{slug}/releases/#{release_id}/release_files/#{id}", query_params), nil, headers, options)
  end
  
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
    uri, body, headers, options = @interceptors.reduce([uri, body, headers, DEFAULT_OPTIONS.merge(options)]) {|r, i| i.before_request(*r) }

    response = Net::HTTP.start(uri.host, uri.port, proxy_addr, proxy_port, proxy_user, proxy_password, options, use_ssl: (uri.scheme == HTTPS)) do |http|
      http.request request_class.new(uri, headers), body
    end

    @observers.reduce(response) {|r, o| o.received_response(r) }
  end

  def uri(path, query_params = {})
    uri = URI.join(domain, path)
    uri.query = URI.encode_www_form(query_params) if !query_params.empty?
    uri
  end

  class JsonCallback
    require 'json'

    APPLICATION_JSON     = 'application/json'.freeze
    JSON_REQUEST_HEADERS = {
      'Content-Type' => APPLICATION_JSON,
      'Accept'       => APPLICATION_JSON
    }.freeze

    def before_request(uri, body, headers, options)
      [uri, (body.nil? ? body : JSON.dump(body)), headers.merge(JSON_REQUEST_HEADERS), options]
    end

    def received_response(response)
      JSON.load(response.body)
    end
  end

  private_constant :JsonCallback
end
