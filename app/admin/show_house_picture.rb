ActiveAdmin.register ShowHousePicture do
  menu :priority => 3, :parent =>  I18n.t("admin.menu.show_house_management")
  #menu :priority => 3,  :label => proc{ I18n.t("admin.show_house_pictures") }
  #breadcrumb do
  #  [
  #      link_to(I18n.t("active_admin.dashboard"), '/admin'),
  #      link_to(I18n.t("admin.show_houses"), '/admin/show_houses'),
  #      #slink_to(proc {|t| t.show_house.title}, proc{|t| admin_show_house_path(t.show_house)}),
  #  ]
  #end

  # 嵌套式的url结构，顶层菜单将没有样板房图片
  #belongs_to :show_house

  index do
    selectable_column
    column :id
    #column I18n.t("admin.show_house_picture.path"), :path
    column :path
    #column :path do |product|
    #  link_to(image_tag(product.path, :width => "50px"), admin_show_house_picture_path(product))
    #end
    column :brief
    column :show_house

    actions
  end

  index :as => :grid do |product|
  #  link_to(image_tag(product.path, :width => "250px"), admin_show_house_show_house_picture_path(product.show_house, product))
    link_to(image_tag(product.path, :width => "250px"), admin_show_house_picture_path( product))
  end


  #index :as => :block do |product|
  #  div :for => product do
  #    h2 auto_link(product.id)
  #    div do
  #      link_to(image_tag(product.path, :width => "250px"), admin_show_house_picture_path(product))
  #    end
  #    div do
  #      product.brief
  #    end
  #  end
  #end
end
