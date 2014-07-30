# coding: utf-8
ActiveAdmin.register MainMaterial do
  menu :priority => 2, :parent =>  I18n.t('admin.menu.quotation_management')

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
  scope("price > 10") { |scope| scope.where('price > 10') }

# conditionally show a custom controller scope
#  scope "Published", :if => proc { current_admin_user.can? :manage, Posts } do |posts|
#    posts.published
#  end


  index do
    selectable_column
    column :id
    column :main_material_name
    column :main_material_brand
    column :specifications
    column :price
    column :type_of_work
    column :decorate_company
    column :picture do |s|
      image_tag(s.picture, :width => "150px")
    end
    actions
  end

  form(:html => { :multipart=>true}) do |f|
    f.inputs MainMaterial.model_name.human do
      f.input :main_material_name_id, :as => :select, collection: MainMaterialName.all()
      f.input :main_material_brand_id, :as => :select, collection: MainMaterialBrand.all()      
      f.input :specifications
      f.input :price
      f.input :type_of_work_id, :as => :select, collection: TypeOfWork.all()
      f.input :decorate_company_id, :as => :select, collection: DecorateCompany.all()
      f.input :picture, :hint => image_tag(main_material.picture, :width => "250px")
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :main_material_name
      row :main_material_brand
      row :specifications
      row :price
      row :type_of_work
      row :decorate_company
      row :picture do |s|
        image_tag(s.picture, :width => "250px")
      end
      row :created_at
      row :updated_at
      active_admin_comments
    end
  end




end
