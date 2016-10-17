Oven.bake :'PivnetAPI::Client', destination: 'lib/' do
  format :json

  get :authentication, "/api/v2/authentication", as: :authentication

  get :products, "/api/v2/products"
  get :product,  "/api/v2/products/:slug"

  patch :release_order, "/api/v2/products/:slug/release_sort_order", as: :sort_release_in_product

  get :eulas, "/api/v2/eulas"
  get :eula,  "/api/v2/eulas/:id"

  post :eula_acceptance, "/api/v2/products/:slug/releases/:release_id/eula_acceptance", as: :accept_eula

  get :user_groups,        "/api/v2/user_groups"
  get :user_group,         "/api/v2/user_groups/:id"
  post :user_group,        "/api/v2/user_groups"
  patch :user_group,       "/api/v2/user_groups/:id"
  delete :user_group,      "/api/v2/user_groups/:id"
  patch :group_membership, "/api/v2/user_groups/:id/add_member",    as: :add_member_to_group
  patch :group_membership, "/api/v2/user_groups/:id/remove_member", as: :remove_member_from_group

  get :product_files,   "/api/v2/products/:slug/product_files"
  get :product_file,    "/api/v2/products/:slug/product_files/:id"
  post :product_file,   "/api/v2/products/:slug/product_files"
  patch :product_file,  "/api/v2/products/:slug/product_files/:id"
  delete :product_file, "/api/v2/products/:slug/product_files/:id"
  patch :file_transfer, "/api/v2/products/:slug/product_files/retry_all", as: :retry_file_transfer

  post :download,           "/api/v2/products/:slug/releases/:release_id/product_files/:id/download"
  post :signature_download, "/api/v2/products/:slug/releases/:release_id/product_files/:id/signature_file_download"

  get :file_groups,       "/api/v2/products/:slug/file_groups"
  get :file_group,        "/api/v2/products/:slug/file_groups/:id"
  post :file_group,       "/api/v2/products/:slug/file_groups"
  patch :file_group,      "/api/v2/products/:slug/file_groups/:id"
  delete :file_group,     "/api/v2/products/:slug/file_groups/:id"
  patch :file_assignment, "/api/v2/products/:slug/file_groups/:id/add_product_file",        as: :add_file_to_group
  patch :file_assignment, "/api/v2/products/:slug/file_groups/:id/remove_product_file",     as: :remove_file_from_group
  patch :file_sort_order, "/api/v2/products/:slug/file_groups/:id/product_file_sort_order", as: :sort_file_in_group

  get :releases,   "/api/v2/products/:slug/releases"
  get :release,    "/api/v2/products/:slug/releases/:id"
  post :release,   "/api/v2/products/:slug/releases"
  patch :release,  "/api/v2/products/:slug/releases/:id"
  delete :release, "/api/v2/products/:slug/releases/:id"

  get :release_files,             "/api/v2/products/:slug/releases/:release_id/product_files"
  get :release_file,              "/api/v2/products/:slug/releases/:release_id/product_files/:id"
  patch :release_file_assignment, "/api/v2/products/:slug/releases/:release_id/add_product_file",        as: :add_file_to_release
  patch :release_file_assignment, "/api/v2/products/:slug/releases/:release_id/remove_product_file",     as: :remove_file_from_release
  patch :release_file_sort_order, "/api/v2/products/:slug/releases/:release_id/product_file_sort_order", as: :sort_file_in_release

  get :release_file_groups,             "/api/v2/products/:slug/releases/:id/file_groups"
  patch :release_file_group_assignment, "/api/v2/products/:slug/releases/:id/add_file_group",        as: :add_file_group_to_release
  patch :release_file_group_assignment, "/api/v2/products/:slug/releases/:id/remove_file_group",     as: :remove_file_group_from_release
  patch :release_file_group_sort_order, "/api/v2/products/:slug/releases/:id/file_group_sort_order", as: :sort_file_group_in_release

  get :release_user_groups,             "/api/v2/products/:slug/releases/:id/user_groups"
  patch :release_user_group_assignment, "/api/v2/products/:slug/releases/:id/add_user_group",    as: :add_user_group_to_release
  patch :release_user_group_assignment, "/api/v2/products/:slug/releases/:id/remove_user_group", as: :remove_user_group_from_release

  get :release_dependencies,    "/api/v2/products/:slug/releases/:id/dependenciess"
  patch :dependency_assignment, "/api/v2/products/:slug/releases/:id/add_dependency",    as: :add_dependency
  patch :dependency_assignment, "/api/v2/products/:slug/releases/:id/remove_dependency", as: :remove_dependency

  get :release_upgrade_paths,     "/api/v2/products/:slug/releases/:id/upgrade_paths"
  patch :upgrade_path_assignment, "/api/v2/products/:slug/releases/:id/add_upgrade_path",    as: :add_upgrade_path
  patch :upgrade_path_assignment, "/api/v2/products/:slug/releases/:id/remove_upgrade_path", as: :remove_upgrade_path
end
