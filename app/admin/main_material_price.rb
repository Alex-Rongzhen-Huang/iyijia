ActiveAdmin.register MainMaterialPrice do
  menu :priority => 2, :parent => I18n.t('admin.menu.quotation_management')
  index do
    selectable_column
    column :id
    column :main_material_name
    column :economy_cost
    column :comfort_cost
    column :luxury_cost
    column :economy
    column :comfort
    column :luxury
    column :updated_at
    actions
  end
end
