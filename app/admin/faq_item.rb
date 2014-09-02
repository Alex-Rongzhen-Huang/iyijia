# encoding: UTF-8
ActiveAdmin.register FaqItem do
  menu :priority => 3, :parent =>  I18n.t("admin.menu.site_management")

  form(:html => { :multipart=>true}) do |f|
    f.inputs ShowHouse.model_name.human do
      f.input :title
      f.input :weight, :hint => content_tag(:span,'数字大的排在前面')
      f.input :description, :as => :ckeditor
    end

    f.actions
  end

  index do
    selectable_column
    column :id
    column :title
    column :weight
    column :description do |faq_item|
      content_tag('span',truncate(faq_item.description, :length => 50))
    end
    column :created_at
    column :updated_at

    actions
  end
end
