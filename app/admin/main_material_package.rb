# coding: utf-8
ActiveAdmin.register MainMaterialPackage do
  menu :priority => 2, :parent =>  I18n.t('admin.menu.quotation_management')

  scope :all, default: true
  scope('1.经济型') { |scope| scope.where(:name => '经济型') }
  scope('2.舒适型') { |scope| scope.where(:name => '舒适型') }
  scope('3.豪华型') { |scope| scope.where(:name => '豪华型') }


  form do |f|
    f.inputs MainMaterialPackage.model_name.human do
      f.input :name, :as => :select, collection: MainMaterialPackage::PACKAGE_TYPES

      f.input :main_material_name_id, :as => :select, :collection => MainMaterialName.all
      # http://apidock.com/rails/v3.2.3/ActionView/Helpers/FormOptionsHelper/option_groups_from_collection_for_select
      f.input :main_material_id, :as => :select, :collection => option_groups_from_collection_for_select(MainMaterialName.all, :main_materials, :name,  :id,:specifications, :selected => (main_material_package.main_material_id if !main_material_package.main_material_id.nil?))

    end
    f.actions
  end

  index do
    selectable_column
    column :name
    column :main_material_name
    column :main_material_brand do |main_material_package|
      link_to(main_material_package.main_material.main_material_brand.name, admin_main_material_brand_path(main_material_package.main_material.main_material_brand))

    end
    column :main_material do |main_material_package|
      link_to(main_material_package.main_material.specifications, admin_main_material_path(main_material_package.main_material));

    end

    actions
  end

end
