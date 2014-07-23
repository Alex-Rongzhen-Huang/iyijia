ActiveAdmin.register ConstructionItem do
  menu :priority => 2, :parent => I18n.t('admin.menu.quotation_management')

  index do
    selectable_column
    column :id
    column :name
    column :type_of_work
    column :process_description
    column :unit

    actions
  end
end
