ActiveAdmin.register DecorateCompany do
  menu :priority => 1, :parent =>  I18n.t("admin.menu.user_management")
  #menu :priority => 1, :label => proc{ I18n.t("admin.decorate_company") }
  #breadcrumb do
  #  [
  #      link_to(I18n.t("active_admin.dashboard"), '/admin'),
  #      link_to(I18n.t("admin.decorate_company"), '/admin/decorate_companies'),
  #  ]
  #end

  show do |cs|
    attributes_table do
      row :id
      row :name
      row :logo_path do
        image_tag(cs.logo_path)
      end
      row :brief
      row :user
      #row I18n.t('admin.decorate_companies.label.user') do
      #  link_to cs.user, admin_user_path(cs.user)
      #end
      row :created_at
      row :updated_at
    end
  end

  form(:html => { :multipart=>true}) do |f|
    f.inputs DecorateCompany.model_name.human do
      f.input :name
      #f.input :user, as: :select, collection: options_for_select(User.where(:role=>'decorator'), User.where(:role=>'decorator').first())
      f.input :user, as: :select, collection: options_for_select(User.where(:role=>'decorator').collect{|x| [x.email, x.id]}, f.object.user.nil? ? User.where(:role=>'decorator').first().id : f.object.user.id)
      f.input :created_date, :as => :datepicker
      f.input :logo_path, :as => :file, :hint => image_tag(f.object.logo_path, width:"50%")

      f.input :brief

    end

    f.buttons
  end


end
