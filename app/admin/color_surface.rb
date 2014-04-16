ActiveAdmin.register ColorSurface do
  menu :priority => 2, :label => proc{ I18n.t("admin.color_surface") }
  breadcrumb do
    [
        link_to(I18n.t("active_admin.dashboard"), '/admin'),
        link_to(I18n.t("admin.color_surface"), '/admin/color_surfaces'),
    ]
  end

  form(:html => { :multipart=>true}) do |f|
       f.inputs "ColorSurface" do
         f.input :title
         f.input :decorate_company_id, as: :select, collection: DecorateCompany.all()

         f.input :picture, :as => :file, :hint => image_tag(f.object.picture, width:"50%")

       end
       f.buttons
   end

   show do |cs|
     attributes_table do
       row :id
       row :title
       row :decorate_company_id
       row :picture do
         image_tag(cs.picture)
       end
       row :created_at
       row :updated_at
     end
     active_admin_comments
   end

end
