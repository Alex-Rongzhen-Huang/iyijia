ActiveAdmin.register AdminUser do
  menu :priority => 5, :label => proc{ I18n.t("admin.admin_user") }

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: AdminUser::ROLES
    end
    f.actions
  end
end
