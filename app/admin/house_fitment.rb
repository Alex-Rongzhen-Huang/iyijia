ActiveAdmin.register HouseFitment do
  menu :priority => 2, :parent =>  I18n.t("admin.menu.decorate_company_management")
  #menu :priority => 4, :label => proc{ I18n.t("admin.house_fitment") }
  #breadcrumb do
  #  [
  #      link_to(I18n.t("active_admin.dashboard"), '/admin'),
  #      link_to(I18n.t("admin.house_fitment"), '/admin/house_fitments'),
  #  ]
  #end
end
