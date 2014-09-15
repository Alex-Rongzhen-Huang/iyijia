# encoding: UTF-8
ActiveAdmin.register OrderQuotation do
  menu :priority => 1, :parent =>  I18n.t("admin.menu.decorate_company_management")



  form(:html => { :multipart=>true}) do |f|
    f.inputs OrderQuotation.model_name.human do
      f.input :order_id   , :as => :select, collection: Order.all
      f.input :main_material_package_type , :as => :select, collection: OrderQuotation::PACKAGE_TYPES

      f.input :confirmed_area, :input_html => { :style => "width:100px;", :maxlength => 20  }
      f.input :constructor
      f.input :constructor_contact

      within @head do
        style :type => 'text/css' do
          "
.has_many_container.custom_construction_items ol, .has_many_container.quotation_selected_items ol {
    display: inline-flex;
}
.has_many_container.custom_construction_items ol li label, .has_many_container.quotation_selected_items ol li label{
    width: 100%;
}
".html_safe
        end
      end
      f.inputs do

        f.has_many :custom_construction_items, :allow_destroy => true, :heading => I18n.t("activerecord.models.custom_construction_item"), :new_record => true do |x|
          x.input :description, :input_html => { :style => "width:100px;", :maxlength => 20  }
          x.input :count, :input_html => { :style => "width:100px;", :maxlength => 20  }
          x.input :price , :input_html => { :style => "width:100px;", :maxlength => 20  }
          x.input :construction_item, :input_html => { :style => "width:100%;", :maxlength => 20  }, :as => :select, collection: ConstructionItem.all

        end
      end

      f.inputs do
        f.has_many :quotation_selected_items , :allow_destroy => true, :heading => I18n.t("activerecord.models.quotation_selected_item"), :new_record => true do |x|
          x.input :main_material_name, :input_html => { :style => "width:100%;", :maxlength => 20  }, :as => :select, collection: MainMaterialName.all
          x.input :main_material_name_sub_category, :input_html => { :style => "width:100%", :maxlength => 20  },
                  :as => :select, :collection => option_groups_from_collection_for_select(MainMaterialName.all, :main_material_name_sub_categories, :name,  :id,:name, :selected => (x.object.main_material_name_sub_category_id if !x.object.main_material_name_sub_category_id.nil?))
          x.input :main_material, :input_html => { :style => "width:100%", :maxlength => 20  },
                  :as => :select, :collection => option_groups_from_collection_for_select(MainMaterialName.all, :main_materials, :name,  :id,:specifications, :selected => (x.object.main_material_id if !x.object.main_material_id.nil?))
          x.input :delta_price,  :input_html => { :style => "width:100px;", :maxlength => 20  }
          x.input :upgrade,   :input_html => { :style => "margin:20px 0px 0px -30px;", :maxlength => 20  }
        end
      end

    end

    f.actions
  end

  #belongs_to :order
  #has_many :custom_construction_items,  :dependent => :destroy
  #accepts_nested_attributes_for :custom_construction_items, allow_destroy: true
  #attr_accessible :custom_construction_items_attributes
  #
  #attr_accessible :order_id,:main_material_package_type,:confirmed_area, :constructor, :constructor_contact

  show do |order_quotation|
    attributes_table do
      row :id
      row :order
      row :main_material_package_type
      row :confirmed_area do |x|
        content_tag('span', "#{x.confirmed_area} 平方米")
      end
      row :constructor
      row :constructor_contact

      order_quotation.custom_construction_items.each_with_index do |x,index|
        row "自定义施工项" do
          content_tag('span', "#{x.construction_item.name}-#{x.description} （#{x.count} #{x.construction_item.unit} x #{x.price}元）")
        end
      end

      order_quotation.quotation_selected_items.each_with_index do |x,index|
        row "选择的主材" do
          content_tag('span', "#{x.main_material.name}-#{x.main_material.specifications} （#{x.upgrade}, #{x.delta_price}元）")
        end
      end
      row '项目总价' do
         content_tag('span','待自动计算')
      end
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    column :id
    column :order
    column :main_material_package_type
    column :confirmed_area
    column :constructor
    column :constructor_contact
    column '项目总价' do |order_quotation|
      content_tag('span','待自动计算')
    end
    column :created_at
    column :updated_at

    actions
  end
end
