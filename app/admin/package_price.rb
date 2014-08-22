ActiveAdmin.register PackagePrice do
  menu :priority => 2, :parent => I18n.t('admin.menu.quotation_management')


  form(:html => { :multipart=>true}) do |f|
    f.inputs ShowHouse.model_name.human do
      f.input :rooms   , :as => :select, collection: PackagePrice::ROOM_TYPES
      f.input :bathrooms , :as => :select, collection: PackagePrice::ROOM_TYPES
      f.input :doors  , :as => :select, collection: PackagePrice::ROOM_TYPES
      f.input :kitchen_area
      f.input :bathroom_area
      f.input :max_usable_area
      f.input :covered_area_range, :as => :select, collection: PackagePrice::AREA_RANGE_TYPES
      f.input :construction_price
      f.input :economy_price
      f.input :comfort_price
      f.input :luxury_price

    end

    f.actions
  end

end
