ActiveAdmin.register PackagePrice do
  menu :priority => 2, :parent => I18n.t('admin.menu.quotation_management')


  form(:html => { :multipart=>true}) do |f|
    f.inputs PackagePrice.model_name.human do
      f.input :rooms   , :as => :select, collection: PackagePrice::ROOM_TYPES
      f.input :bathrooms , :as => :select, collection: PackagePrice::BATHROOM_TYPES
      f.input :doors  , :as => :select, collection: PackagePrice::ROOM_TYPES
      f.input :kitchen_area
      f.input :bathroom_area
      f.input :max_usable_area
      f.input :covered_area_range, :as => :select, collection: PackagePrice::AREA_RANGE_TYPES
      f.input :construction_price
     # f.input :economy_price
     # f.input :comfort_price
     # f.input :luxury_price

    end

    f.actions
  end

  index do
    selectable_column
    column :id do  |object|
      link_to(object.id, admin_package_price_path(object))
    end
    column :covered_area_range
    column :construction_price
    column :economy_price
    column :comfort_price
    column :luxury_price
    actions
  end

end
