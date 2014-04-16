ActiveAdmin.register ShowHouse do
  menu :priority => 3, :label => proc{ I18n.t("admin.show_houses") }
  breadcrumb do
    [
        link_to(I18n.t("active_admin.dashboard"), '/admin'),
        link_to(I18n.t("admin.show_houses"), '/admin/show_houses'),
    ]
  end

  # 嵌套式的结构
  #sidebar I18n.t("admin.show_house.details"), only: [:show, :edit] do
  #  ul do
  #    li link_to(I18n.t("admin.show_house_pictures"), admin_show_house_show_house_pictures_path(show_house))
  #  end
  #end

  sidebar I18n.t("admin.show_house.details"), only: [:show, :edit] do
    ul do
      li link_to(I18n.t("admin.show_house_pictures"), admin_show_house_pictures_path)
    end
  end

  form(:html => { :multipart=>true}) do |f|
    f.inputs "ShowHouse" do
      f.input :title
      f.input :decorate_company_id, as: :select, collection: DecorateCompany.all()
      f.input :area
      f.input :house_type
      f.input :price
      f.input :style
      f.input :need_to_know, :as => :ckeditor
      f.input :overview, :as => :ckeditor
      f.input :brief, :as => :ckeditor

      f.inputs do
        f.has_many :show_house_pictures, :allow_destroy => true, :heading => 'Pictures', :new_record => true do |cf|
          cf.input :path, :as => :file , :hint => image_tag(cf.object.path, width:"50%")
          cf.input :brief

        end
      end

    end

    f.buttons
  end
end
