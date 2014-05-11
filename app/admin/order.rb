ActiveAdmin.register Order do
  menu :priority => 4, :parent =>  I18n.t("admin.menu.decorate_company_management")
  #menu :priority => 4, :label => proc{ I18n.t("admin.order") }
  #breadcrumb do
  #  [
  #      link_to(I18n.t("active_admin.dashboard"), '/admin'),
  #      link_to(I18n.t("admin.order"), '/admin/orders'),
  #  ]
  #end
end
