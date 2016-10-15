require 'test_helper'

class PivnetApiTest < Minitest::Test
  ENDPOINT  = ENV['PIVOTAL_NETWORK_API_ENDPOINT']
  API_TOKEN = ENV['PIVOTAL_NETWORK_API_TOKEN']

  def setup
    @client = PivnetAPI.build(API_TOKEN, domain: ENDPOINT)
  end

  def test_authentication
    response = @client.authentication()

    assert_equal '200', response.code
  end

  def test_get_products
    response = @client.get_products()

    assert_equal '200', response.code
  end

  def test_get_product
    slug = 'pivotal-cf' # TODO: assign an appropriate value.
    response = @client.get_product(slug)

    assert_equal '200', response.code
  end

  def test_sort_release_in_product
    slug = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.sort_release_in_product(slug, body)

    assert_equal '200', response.code
  end

  def test_get_eulas
    response = @client.get_eulas()

    assert_equal '200', response.code
  end

  def test_get_eula
    id = # TODO: assign an appropriate value.
    response = @client.get_eula(id)

    assert_equal '200', response.code
  end

  def test_accept_eula
    slug = # TODO: assign an appropriate value.
    release_id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.accept_eula(slug, release_id, body)

    assert_equal '200', response.code
  end

  def test_get_user_groups
    response = @client.get_user_groups()

    assert_equal '200', response.code
  end

  def test_get_user_group
    id = # TODO: assign an appropriate value.
    response = @client.get_user_group(id)

    assert_equal '200', response.code
  end

  def test_post_user_group
    body = # TODO: assign an appropriate value.
    response = @client.post_user_group(body)

    assert_equal '200', response.code
  end

  def test_patch_user_group
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.patch_user_group(id, body)

    assert_equal '200', response.code
  end

  def test_delete_user_group
    id = # TODO: assign an appropriate value.
    response = @client.delete_user_group(id)

    assert_equal '200', response.code
  end

  def test_add_member_to_group
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.add_member_to_group(id, body)

    assert_equal '200', response.code
  end

  def test_remove_member_from_group
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.remove_member_from_group(id, body)

    assert_equal '200', response.code
  end

  def test_get_product_files
    slug = # TODO: assign an appropriate value.
    response = @client.get_product_files(slug)

    assert_equal '200', response.code
  end

  def test_get_product_file
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    response = @client.get_product_file(slug, id)

    assert_equal '200', response.code
  end

  def test_post_product_file
    slug = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.post_product_file(slug, body)

    assert_equal '200', response.code
  end

  def test_patch_product_file
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.patch_product_file(slug, id, body)

    assert_equal '200', response.code
  end

  def test_delete_product_file
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    response = @client.delete_product_file(slug, id)

    assert_equal '200', response.code
  end

  def test_retry_file_transfer
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.retry_file_transfer(slug, id, body)

    assert_equal '200', response.code
  end

  def test_post_download
    slug = # TODO: assign an appropriate value.
    release_id = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.post_download(slug, release_id, id, body)

    assert_equal '200', response.code
  end

  def test_post_signature_download
    slug = # TODO: assign an appropriate value.
    release_id = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.post_signature_download(slug, release_id, id, body)

    assert_equal '200', response.code
  end

  def test_get_file_groups
    slug = # TODO: assign an appropriate value.
    response = @client.get_file_groups(slug)

    assert_equal '200', response.code
  end

  def test_get_file_group
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    response = @client.get_file_group(slug, id)

    assert_equal '200', response.code
  end

  def test_post_file_group
    slug = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.post_file_group(slug, body)

    assert_equal '200', response.code
  end

  def test_patch_file_group
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.patch_file_group(slug, id, body)

    assert_equal '200', response.code
  end

  def test_delete_file_group
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    response = @client.delete_file_group(slug, id)

    assert_equal '200', response.code
  end

  def test_add_file_to_group
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.add_file_to_group(slug, id, body)

    assert_equal '200', response.code
  end

  def test_remove_file_from_group
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.remove_file_from_group(slug, id, body)

    assert_equal '200', response.code
  end

  def test_sort_file_in_group
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.sort_file_in_group(slug, id, body)

    assert_equal '200', response.code
  end

  def test_get_releases
    slug = # TODO: assign an appropriate value.
    response = @client.get_releases(slug)

    assert_equal '200', response.code
  end

  def test_get_release
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    response = @client.get_release(slug, id)

    assert_equal '200', response.code
  end

  def test_post_release
    slug = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.post_release(slug, body)

    assert_equal '200', response.code
  end

  def test_patch_release
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.patch_release(slug, id, body)

    assert_equal '200', response.code
  end

  def test_delete_release
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    response = @client.delete_release(slug, id)

    assert_equal '200', response.code
  end

  def test_get_release_files
    slug = # TODO: assign an appropriate value.
    release_id = # TODO: assign an appropriate value.
    response = @client.get_release_files(slug, release_id)

    assert_equal '200', response.code
  end

  def test_get_release_file
    slug = # TODO: assign an appropriate value.
    release_id = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    response = @client.get_release_file(slug, release_id, id)

    assert_equal '200', response.code
  end

  def test_add_file_to_release
    slug = # TODO: assign an appropriate value.
    release_id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.add_file_to_release(slug, release_id, body)

    assert_equal '200', response.code
  end

  def test_remove_file_from_release
    slug = # TODO: assign an appropriate value.
    release_id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.remove_file_from_release(slug, release_id, body)

    assert_equal '200', response.code
  end

  def test_sort_file_in_release
    slug = # TODO: assign an appropriate value.
    release_id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.sort_file_in_release(slug, release_id, body)

    assert_equal '200', response.code
  end

  def test_get_release_file_groups
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    response = @client.get_release_file_groups(slug, id)

    assert_equal '200', response.code
  end

  def test_add_file_group_to_release
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.add_file_group_to_release(slug, id, body)

    assert_equal '200', response.code
  end

  def test_remove_file_group_from_release
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.remove_file_group_from_release(slug, id, body)

    assert_equal '200', response.code
  end

  def test_sort_file_group_in_release
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.sort_file_group_in_release(slug, id, body)

    assert_equal '200', response.code
  end

  def test_get_release_user_groups
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    response = @client.get_release_user_groups(slug, id)

    assert_equal '200', response.code
  end

  def test_add_user_group_to_release
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.add_user_group_to_release(slug, id, body)

    assert_equal '200', response.code
  end

  def test_remove_user_group_from_release
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.remove_user_group_from_release(slug, id, body)

    assert_equal '200', response.code
  end

  def test_get_release_dependencies
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    response = @client.get_release_dependencies(slug, id)

    assert_equal '200', response.code
  end

  def test_add_dependency
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.add_dependency(slug, id, body)

    assert_equal '200', response.code
  end

  def test_remove_dependency
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.remove_dependency(slug, id, body)

    assert_equal '200', response.code
  end

  def test_get_release_upgrade_paths
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    response = @client.get_release_upgrade_paths(slug, id)

    assert_equal '200', response.code
  end

  def test_add_upgrade_path
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.add_upgrade_path(slug, id, body)

    assert_equal '200', response.code
  end

  def test_remove_upgrade_path
    slug = # TODO: assign an appropriate value.
    id = # TODO: assign an appropriate value.
    body = # TODO: assign an appropriate value.
    response = @client.remove_upgrade_path(slug, id, body)

    assert_equal '200', response.code
  end
end
