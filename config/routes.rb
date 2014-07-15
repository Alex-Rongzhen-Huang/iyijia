Iyijia::Application.routes.draw do
  resources :my_project_items


  resources :my_projects


  resources :decorate_scheme_items


  resources :decorate_schemes


  resources :user_profiles


  resources :quotation_template_items


  resources :quotation_templates


  resources :construction_items


  resources :main_materials


  resources :home_image_settings


  resources :main_material_brands


  get "home/index"

  devise_for :users

  mount Ckeditor::Engine => '/ckeditor'

  resources :show_house_pictures


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :orders


  resources :house_fitments


  resources :color_surfaces


  resources :show_houses

  match '/show_houses/like/:id' => 'show_houses#like'
  match '/show_houses/unlike/:id' => 'show_houses#unlike'
  match '/user_admin/order/new', to: 'user_admin#order_new', as: :order_new
  match '/user_admin/pre_order', to: 'user_admin#pre_order', as: :pre_order
  match '/user_admin/old_quotation', to: 'user_admin#old_quotation', as: :old_quotation
  match '/user_admin/favorites', to: 'user_admin#favorites', as: :favorites

  resources :decorate_companies


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root to: "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
