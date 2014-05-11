ActiveAdmin.register ShowHouse do
  menu :priority => 3
#  menu :priority => 3, :label => proc{ I18n.t("admin.show_houses") }
#  breadcrumb do
#    [
#        link_to(I18n.t("active_admin.dashboard"), '/admin'),
#        link_to(I18n.t("admin.show_houses"), '/admin/show_houses'),
#    ]
#  end

  # 嵌套式的结构
  #sidebar I18n.t("admin.show_house.details"), only: [:show, :edit] do
  #  ul do
  #    li link_to(I18n.t("admin.show_house_pictures"), admin_show_house_show_house_pictures_path(show_house))
  #  end
  #end

  sidebar ShowHousePicture.model_name.human, only: [:show, :edit] do
    ul do
      li link_to(ShowHousePicture.model_name.human, admin_show_house_pictures_path)

    end
    div do
      ul do
        show_house.show_house_pictures.each do |x|
          li link_to(image_tag(x.path, :width => "160px"), edit_admin_show_house_picture_path(x.id))
        end
      end

    end
  end

  form(:html => { :multipart=>true}) do |f|
    f.inputs ShowHouse.model_name.human do
      f.input :title
      f.input :decorate_company_id, as: :select, collection: DecorateCompany.all()
      f.input :area
      f.input :house_type, :as => :select, collection: ShowHouse::HOUSE_TYPES
      f.input :price
      f.input :style, :as => :select, collection: ShowHouse::STYLE_TYPES
      f.input :concept
      f.input :usage
      f.input :need_to_know, :as => :ckeditor
      f.input :overview, :as => :ckeditor
      f.input :brief, :as => :ckeditor

      f.inputs do
        f.has_many :show_house_pictures, :allow_destroy => true, :heading => 'Pictures', :new_record => true do |cf|
          cf.input :path, :as => :file , :hint => image_tag(cf.object.path, width:"50%")
          cf.input :brief

        end
      end

      f.input :main_material_brand_ids, as: :select, collection: MainMaterialBrand.all, multiple: true

    end

    f.buttons
  end
end
