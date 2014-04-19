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
      row :user_id
      row :created_at
      row :updated_at
    end
  end

  form(:html => { :multipart=>true}) do |f|
    f.inputs "DecorateCompany" do
      f.input :name
      f.input :user_id, as: :select, collection: options_for_select(User.where(:role=>'decorator'), User.where(:role=>'decorator').first())

      f.input :brief

    end

    f.buttons
  end

end
