ActiveAdmin.register DecorateCompany do
  menu :priority => 1, :label => proc{ I18n.t("admin.decorate_company") }
  breadcrumb do
    [
        link_to(I18n.t("active_admin.dashboard"), '/admin'),
        link_to(I18n.t("admin.decorate_company"), '/admin/decorate_companies'),
    ]
  end

  show do |cs|
    attributes_table do
      row :id
      row :name
      row :brief
      row :admin_user_id if current_admin_user.role != 'super'
      row :created_at
      row :updated_at
    end
  end

  form(:html => { :multipart=>true}) do |f|
    f.inputs "DecorateCompany" do
      f.input :name
      f.input :admin_user_id, as: :select, collection: AdminUser.all() if  current_admin_user.role == 'super'

      f.input :brief

    end

    f.buttons
  end

end
