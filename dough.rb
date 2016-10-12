Oven.bake :'PivnetAPI::Client', destination: 'lib/' do
  format :json

  get :authentication, "/api/v2/authentication"

  get :products,           "/api/v2/products"
  get :product, ->(slug) { "/api/v2/products/#{slug}" }
  patch :release_sort_order, ->(slug) { "/api/v2/products/#{slug}/release_sort_order" }

  get :eulas,         "/api/v2/eulas"
  get :eula, ->(id) { "/api/v2/eulas/#{id}" }
  post :eula_acceptance, ->(slug, release_id) { "/api/v2/products/#{slug}/releases/#{release_id}/eula_acceptance" }

  get :user_groups,              "/api/v2/user_groups"
  get :user_group,      ->(id) { "/api/v2/user_groups/#{id}" }
  post :user_group,              "/api/v2/user_groups"
  patch :user_group,    ->(id) { "/api/v2/user_groups/#{id}" }
  delete :user_group,   ->(id) { "/api/v2/user_groups/#{id}" }
  patch :add_member,    ->(id) { "/api/v2/user_groups/#{id}/add_member" }
  patch :remove_member, ->(id) { "/api/v2/user_groups/#{id}/remove_member" }

  get :product_files,    ->(slug)     { "/api/v2/products/#{slug}/product_files" }
  get :product_file,     ->(slug, id) { "/api/v2/products/#{slug}/product_files/#{id}" }
  post :product_file,    ->(slug)     { "/api/v2/products/#{slug}/product_files" }
  patch :product_file,   ->(slug, id) { "/api/v2/products/#{slug}/product_files/#{id}" }
  delete :product_file,  ->(slug, id) { "/api/v2/products/#{slug}/product_files/#{id}" }
  patch :file_transfers, ->(slug, id) { "/api/v2/products/#{slug}/product_files/retry_all" }

  post :download,           ->(slug, release_id, id) { "/api/v2/products/#{slug}/releases/#{release_id}/product_files/#{id}/download" }
  post :signature_download, ->(slug, release_id, id) { "/api/v2/products/#{slug}/releases/#{release_id}/product_files/#{id}/signature_file_download" }

  get :file_groups,            ->(slug)     { "/api/v2/products/#{slug}/file_groups" }
  get :file_group,             ->(slug, id) { "/api/v2/products/#{slug}/file_groups/#{id}" }
  post :file_group,            ->(slug)     { "/api/v2/products/#{slug}/file_groups" }
  patch :file_group,           ->(slug, id) { "/api/v2/products/#{slug}/file_groups/#{id}" }
  delete :file_group,          ->(slug, id) { "/api/v2/products/#{slug}/file_groups/#{id}" }
  patch :add_product_file,     ->(slug, id) { "/api/v2/products/#{slug}/file_groups/#{id}/add_product_file" }
  delete :remove_product_file, ->(slug, id) { "/api/v2/products/#{slug}/file_groups/#{id}/remove_product_file" }
  patch :file_sort_order,      ->(slug, id) { "/api/v2/products/#{slug}/file_groups/#{id}/product_file_sort_order" }

  get :releases,   ->(slug)     { "/api/v2/products/#{slug}/releases" }
  get :release,    ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}" }
  post :release,   ->(slug)     { "/api/v2/products/#{slug}/releases" }
  patch :release,  ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}" }
  delete :release, ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}" }

  get :release_files,   ->(slug, release_id)     { "/api/v2/products/#{slug}/releases/#{release_id}/release_files" }
  get :release_file,    ->(slug, release_id, id) { "/api/v2/products/#{slug}/releases/#{release_id}/release_files/#{id}" }
  post :release_file,   ->(slug, release_id)     { "/api/v2/products/#{slug}/releases/#{release_id}/release_files" }
  patch :release_file,  ->(slug, release_id, id) { "/api/v2/products/#{slug}/releases/#{release_id}/release_files/#{id}" }
  delete :release_file, ->(slug, release_id, id) { "/api/v2/products/#{slug}/releases/#{release_id}/release_files/#{id}" }
end
