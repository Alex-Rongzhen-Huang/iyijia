# encoding: UTF-8
ActiveAdmin.register HomeBrandSetting do
  menu :priority => 2, :parent =>  I18n.t("admin.menu.site_management")

  form(:html => {:multipart => true}) do |f|

    f.inputs HomeBrandSetting.model_name.human do

      f.input :package_type, :as => :select, collection: HomeBrandSetting::PACKAGE_TYPES
      f.input :path, :as => :file, :hint => content_tag(:span, "为了显示效果，请上传分辨率为 100x100 的图片")+content_tag(:br)+image_tag(f.object.path, width: "50%")

    end
    f.actions
  end


  show do |cs|
    attributes_table do
      row :package_type
      row :path do
        image_tag(cs.path.t.url)
      end
    end
    active_admin_comments
  end

  index do
    selectable_column
    column :package_type
    column :path do |s|
      link_to(image_tag(s.path.t.url, :width => "100px"), admin_home_brand_setting_path(s))
    end
    actions
  end
end
