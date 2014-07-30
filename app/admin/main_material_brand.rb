ActiveAdmin.register MainMaterialBrand do
  menu :priority => 2, :parent =>  I18n.t('admin.menu.quotation_management')
  
  index do
    selectable_column
    column :id
    column :name
    column :main_material_name
    column :logo_path do |s|
      image_tag(s.logo_path, :width => "150px")
    end
    actions
  end
  
  show do
    attributes_table do
      row :id
      row :name
      row :main_material_name
      row :logo_path do |s|
        image_tag(s.logo_path, :width => "250px")
      end
      row :created_at
      row :updated_at
      active_admin_comments
    end
  end
  
  form(:html => { :multipart=>true}) do |f|
    f.inputs MainMaterialBrand.model_name.human do
      f.input :main_material_name_id, :as => :select, collection: MainMaterialName.all()
      f.input :name
      f.input :logo_path, :hint => image_tag(main_material_brand.logo_path, :width => "250px")
    end
    f.actions
  end
  
end
