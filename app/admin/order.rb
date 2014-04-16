ActiveAdmin.register Order do
  menu :priority => 4, :label => proc{ I18n.t("admin.order") }
  breadcrumb do
    [
        link_to(I18n.t("active_admin.dashboard"), '/admin'),
        link_to(I18n.t("admin.order"), '/admin/orders'),
    ]
  end
end
