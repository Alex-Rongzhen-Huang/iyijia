ActiveAdmin.register MainMaterialPackage do
  menu :priority => 2, :parent =>  I18n.t('admin.menu.quotation_management')

  form do |f|
    f.inputs MainMaterialPackage.model_name.human do
      f.input :name, :as => :select, collection: MainMaterialPackage::PACKAGE_TYPES

      f.input :main_material_name_id, :as => :select, :collection => MainMaterialName.all
      # http://apidock.com/rails/v3.2.3/ActionView/Helpers/FormOptionsHelper/option_groups_from_collection_for_select
      f.input :main_material_id, :as => :select, :collection => option_groups_from_collection_for_select(MainMaterialName.all, :main_materials, :name,  :id,:specifications, :selected => (main_material_package.main_material_id if !main_material_package.main_material_id.nil?))

    end
    f.actions
  end
end
