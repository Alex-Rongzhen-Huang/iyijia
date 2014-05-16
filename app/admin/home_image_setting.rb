# encoding: UTF-8

ActiveAdmin.register HomeImageSetting do
  menu :priority => 4
  # , :parent =>  I18n.t("admin.menu.home_image_setting")

  # 去除创建按钮，但是在没有任何记录的时候保留创建链接，see: http://stackoverflow.com/questions/7815319/activeadmin-disabling-the-new-resource-method
  config.clear_action_items!

  #menu :priority => 4, :label => proc{ I18n.t("admin.order") }
  #breadcrumb do
  #  [
  #      link_to(I18n.t("active_admin.dashboard"), '/admin'),
  #      link_to(I18n.t("admin.order"), '/admin/orders'),
  #  ]
  #end

  form(:html => { :multipart=>true}) do |f|

    f.inputs HomeImageSetting.model_name.human do

      f.input :img1, :as => :file, :hint => content_tag(:span,"为了显示效果，请上传分辨率为 1770x627 的图片")+content_tag(:br)+image_tag(f.object.img2, width:"50%")
      f.input :img2, :as => :file, :hint => content_tag(:span,"为了显示效果，请上传分辨率为 1770x627 的图片")+content_tag(:br)+image_tag(f.object.img2, width:"50%")
      f.input :img3, :as => :file, :hint => content_tag(:span,"为了显示效果，请上传分辨率为 1770x627 的图片")+content_tag(:br)+image_tag(f.object.img3, width:"50%")
      f.input :img4, :as => :file, :hint => content_tag(:span,"为了显示效果，请上传分辨率为 1770x627 的图片")+content_tag(:br)+image_tag(f.object.img4, width:"50%")
      f.input :img5, :as => :file, :hint => content_tag(:span,"为了显示效果，请上传分辨率为 1770x627 的图片")+content_tag(:br)+image_tag(f.object.img5, width:"50%")

    end
    f.buttons
  end

  show do |cs|
    attributes_table do
      row :img1 do
        image_tag(cs.img1)
      end
      row :img2 do
        image_tag(cs.img2)
      end
      row :img3 do
        image_tag(cs.img3)
      end
      row :img4 do
        image_tag(cs.img4)
      end
      row :img5 do
        image_tag(cs.img5)
      end
    end
    active_admin_comments
  end

  index do
    selectable_column
    column :img1 do |s|
      link_to(image_tag(s.img1, :width => "150px"), admin_home_image_setting_path(s))
    end
    column :img2 do |s|
      link_to(image_tag(s.img2, :width => "150px"), admin_home_image_setting_path(s))
    end
    column :img3 do |s|
      link_to(image_tag(s.img3, :width => "150px"), admin_home_image_setting_path(s))
    end
    column :img4 do |s|
      link_to(image_tag(s.img4, :width => "150px"), admin_home_image_setting_path(s))
    end
    column :img5 do |s|
      link_to(image_tag(s.img5, :width => "150px"), admin_home_image_setting_path(s))
    end


    default_actions
  end
end
