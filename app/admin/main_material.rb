# coding: utf-8
ActiveAdmin.register MainMaterial do
  menu :priority => 2, :parent =>  I18n.t('admin.menu.quotation_management')
  
  collection_action :autocomplete_main_material_specifications, :method => :get

  controller do
    autocomplete :main_material, :specifications, :full => true, :limit => 10, :scopes => [:uniquely_named]
  end

  filter :main_material_name
  filter :main_material_brand
  filter :specifications
  filter :price
  filter :type_of_work

# assumes the model has a scope called ':active'
#  scope :active

# Dynamic scope name
#  scope ->{ Date.today.strftime '%A' }, :published_today

# custom scope not defined on the model
#  scope("Inactive") { |scope| scope.where(active: false) }
  scope :all, default: true
  #scope("1.经济型") { |scope| scope.where('package_type = "经济型"') }
  #scope("2.舒适型") { |scope| scope.where('package_type = "舒适型"') }

# conditionally show a custom controller scope
#  scope "Published", :if => proc { current_admin_user.can? :manage, Posts } do |posts|
#    posts.published
#  end

  index do
    selectable_column
    column :id
    column :name
    column :package_type
    column :main_material_name
    column :main_material_brand
    column :specifications
    column :price
    #column :type_of_work
    #column :decorate_company
    column :description
    column :picture do |s|
      image_tag(s.picture, :width => "150px")
    end
    actions
  end

  form(:html => { :multipart=>true}) do |f|
    f.inputs MainMaterial.model_name.human do
      f.input :name
      f.input :package_type, :as => :select, collection: MainMaterial::PACKAGE_TYPES

      f.input :main_material_name, :as => :select, :collection => MainMaterialName.all
      f.input :main_material_brand, :as => :select, :collection => option_groups_from_collection_for_select(MainMaterialName.all, :main_material_brands, :name, :id, :name, :selected => (main_material.main_material_brand_id if !main_material.main_material_brand_id.nil?))
      within @head do
        script :src => javascript_path('autocomplete-rails.js'), :type => "text/javascript"
        script :src => javascript_path('jquery-ui.js'), :type => "text/javascript"
      end
      f.input :specifications, :as => :autocomplete, :url => autocomplete_main_material_specifications_admin_main_materials_path
      f.input :price
      f.input :type_of_work_id, :as => :select, collection: TypeOfWork.order('name asc').all()
      f.input :decorate_company_id, :as => :select, collection: DecorateCompany.all()
      f.input :description
      f.input :picture, :hint => image_tag(main_material.picture, :width => "250px")

    end
    f.actions
  end


  show do
    attributes_table do
      row :id
      row :name
      row :package_type
      row :main_material_name
      row :main_material_brand
      row :specifications
      row :price
      row :type_of_work
      row :decorate_company
      row :description
      row :picture do |s|
        image_tag(s.picture, :width => "250px")
      end
      row :created_at
      row :updated_at
      active_admin_comments
    end
  end




end
