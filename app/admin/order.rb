ActiveAdmin.register Order do
  menu :priority => 4, :parent =>  I18n.t("admin.menu.decorate_company_management")
  #menu :priority => 4, :label => proc{ I18n.t("admin.order") }
  #breadcrumb do
  #  [
  #      link_to(I18n.t("active_admin.dashboard"), '/admin'),
  #      link_to(I18n.t("admin.order"), '/admin/orders'),
  #  ]
  #end
  scope :all, default: true
  scope("未测量订单") { |scope| scope.where('measure_status = "未测量"') }
  scope("已测量订单") { |scope| scope.where('measure_status = "已测量"') }
  scope("已测量订单-已报价订单") { |scope| scope.where('measure_status = "已测量"') }
  scope("已测量订单-未报价订单") { |scope| scope.where('measure_status = "已测量"') }

  index do
    selectable_column
    column :id
    #column I18n.t("admin.show_house_picture.path"), :path
    column :status do |order|
      status_tag(order.status)
    end
    #column :path do |product|
    #  link_to(image_tag(product.path, :width => "50px"), admin_show_house_picture_path(product))
    #end
    column :user_id
    column :decorate_company_id
    column :show_house_id
    column :house_fitment_id

             default_actions
  end
end
