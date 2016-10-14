Oven.bake :'PivnetAPI::Client', destination: 'lib/' do
  format :json

  get :authentication, "/api/v2/authentication", as: :authentication

  get :products,                  "/api/v2/products"
  get :product,        ->(slug) { "/api/v2/products/#{slug}" }
  patch :sort_release, ->(slug) { "/api/v2/products/#{slug}/release_sort_order" }, as: :sort_release_in_product

  get :eulas,         "/api/v2/eulas"
  get :eula, ->(id) { "/api/v2/eulas/#{id}" }
  post :eula_acceptance, ->(slug, release_id) { "/api/v2/products/#{slug}/releases/#{release_id}/eula_acceptance" }, as: :accept_eula

  get :user_groups,              "/api/v2/user_groups"
  get :user_group,      ->(id) { "/api/v2/user_groups/#{id}" }
  post :user_group,              "/api/v2/user_groups"
  patch :user_group,    ->(id) { "/api/v2/user_groups/#{id}" }
  delete :user_group,   ->(id) { "/api/v2/user_groups/#{id}" }
  patch :add_member,    ->(id) { "/api/v2/user_groups/#{id}/add_member" },    as: :add_member_to_group
  patch :remove_member, ->(id) { "/api/v2/user_groups/#{id}/remove_member" }, as: :remove_member_from_group

  get :product_files,   ->(slug)     { "/api/v2/products/#{slug}/product_files" }
  get :product_file,    ->(slug, id) { "/api/v2/products/#{slug}/product_files/#{id}" }
  post :product_file,   ->(slug)     { "/api/v2/products/#{slug}/product_files" }
  patch :product_file,  ->(slug, id) { "/api/v2/products/#{slug}/product_files/#{id}" }
  delete :product_file, ->(slug, id) { "/api/v2/products/#{slug}/product_files/#{id}" }
  patch :file_transfer, ->(slug, id) { "/api/v2/products/#{slug}/product_files/retry_all" }, as: :retry_file_transfer

  post :download,           ->(slug, release_id, id) { "/api/v2/products/#{slug}/releases/#{release_id}/product_files/#{id}/download" }
  post :signature_download, ->(slug, release_id, id) { "/api/v2/products/#{slug}/releases/#{release_id}/product_files/#{id}/signature_file_download" }

  get :file_groups,            ->(slug)     { "/api/v2/products/#{slug}/file_groups" }
  get :file_group,             ->(slug, id) { "/api/v2/products/#{slug}/file_groups/#{id}" }
  post :file_group,            ->(slug)     { "/api/v2/products/#{slug}/file_groups" }
  patch :file_group,           ->(slug, id) { "/api/v2/products/#{slug}/file_groups/#{id}" }
  delete :file_group,          ->(slug, id) { "/api/v2/products/#{slug}/file_groups/#{id}" }
  patch :add_product_file,     ->(slug, id) { "/api/v2/products/#{slug}/file_groups/#{id}/add_product_file" },        as: :add_file_to_group
  patch :remove_product_file,  ->(slug, id) { "/api/v2/products/#{slug}/file_groups/#{id}/remove_product_file" },     as: :remove_file_from_group
  patch :file_sort_order,      ->(slug, id) { "/api/v2/products/#{slug}/file_groups/#{id}/product_file_sort_order" }, as: :sort_file_in_group

  get :releases,   ->(slug)     { "/api/v2/products/#{slug}/releases" }
  get :release,    ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}" }
  post :release,   ->(slug)     { "/api/v2/products/#{slug}/releases" }
  patch :release,  ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}" }
  delete :release, ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}" }

  get :release_files,         ->(slug, release_id)     { "/api/v2/products/#{slug}/releases/#{release_id}/product_files" }
  get :release_file,          ->(slug, release_id, id) { "/api/v2/products/#{slug}/releases/#{release_id}/product_files/#{id}" }
  patch :add_release_file,    ->(slug, release_id)     { "/api/v2/products/#{slug}/releases/#{release_id}/add_product_file" },        as: :add_file_to_release
  patch :remove_release_file, ->(slug, release_id)     { "/api/v2/products/#{slug}/releases/#{release_id}/remove_product_file" },     as: :remove_file_from_release
  patch :sort_release_file,   ->(slug, release_id)     { "/api/v2/products/#{slug}/releases/#{release_id}/product_file_sort_order" }, as: :sort_file_in_release

  get :release_file_groups, ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}/file_groups" }
  patch :add_file_group,    ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}/add_file_group" },        as: :add_file_group_to_release
  patch :remove_file_group, ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}/remove_file_group" },     as: :remove_file_group_from_release
  patch :sort_file_group,   ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}/file_group_sort_order" }, as: :sort_file_group_in_release

  get :release_user_groups, ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}/user_groups" }
  patch :add_user_group,    ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}/add_user_group" }, as: :add_user_group_to_release
  patch :remove_user_group, ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}/remove_user_group" }, as: :remove_user_group_from_release

  get :release_dependencies, ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}/dependenciess" }
  patch :add_dependency,     ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}/add_dependency" },    as: :add_dependency
  patch :remove_dependency,  ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}/remove_dependency" }, as: :remove_dependency

  get :release_upgrade_paths, ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}/upgrade_paths" }
  patch :add_upgrade_path,    ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}/add_upgrade_path" },    as: :add_upgrade_path
  patch :remove_upgrade_path, ->(slug, id) { "/api/v2/products/#{slug}/releases/#{id}/remove_upgrade_path" }, as: :remove_upgrade_path
end
