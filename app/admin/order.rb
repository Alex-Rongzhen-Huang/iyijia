# encoding: UTF-8
ActiveAdmin.register Order do
  menu :priority => 1, :parent =>  I18n.t("admin.menu.decorate_company_management")
  #menu :priority => 4, :label => proc{ I18n.t("admin.order") }
  #breadcrumb do
  #  [
  #      link_to(I18n.t("active_admin.dashboard"), '/admin'),
  #      link_to(I18n.t("admin.order"), '/admin/orders'),
  #  ]
  #end
  scope :all, default: true
  scope("未测量订单") { |scope| scope.where(:measure_status => '未测量') }
  scope("已测量订单") { |scope| scope.where(:measure_status => '已测量') }
  scope("已报价订单") { |scope| scope.where(:quotation_status => '已报价') }
  scope("未报价订单") { |scope| scope.where(:quotation_status => '未报价') }

  index do
    selectable_column
    column :id
    #column I18n.t("admin.show_house_picture.path"), :path
    column :measure_status do |order|
      status_tag(order.measure_status, order.measure_status=='未测量'?:orange : :green)
    end
    column :quotation_status do |order|
      status_tag(order.quotation_status, order.quotation_status=='未报价'?:red : :green)
    end
    #column :path do |product|
    #  link_to(image_tag(product.path, :width => "50px"), admin_show_house_picture_path(product))
    #end
    column :user
    column :decorate_company
    column :show_house
    column :house_fitment

             actions
  end

  form(:html => { :multipart=>true}) do |f|
    f.inputs Order.model_name.human do
      f.input :user
      f.input :decorate_company
      f.input :show_house
      f.input :house_fitment

      f.input :measure_status, :as => :select, collection: Order::MEASURE_STATUS
      f.input :quotation_status, :as => :select, collection: Order::QUOTATION_STATUS
      f.input :quotation_link

    end

    f.actions
  end


end
