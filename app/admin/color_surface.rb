ActiveAdmin.register ColorSurface do
  menu :priority => 2
  #menu :priority => 2, :label => proc{ I18n.t("admin.color_surface") }
  #breadcrumb do
  #  [
  #      link_to(I18n.t("active_admin.dashboard"), '/admin'),
  #      link_to(I18n.t("admin.color_surface"), '/admin/color_surfaces'),
  #  ]
  #end

  form(:html => { :multipart=>true}) do |f|

       f.inputs ColorSurface.model_name.human do
         f.input :title
         # Note: superadmin can select any decorator
         f.input :decorate_company, as: :select, collection: options_for_select(DecorateCompany.all().collect{|x| [x.name, x.id]}, f.object.decorate_company.nil? ? DecorateCompany.all().first().id : f.object.decorate_company.id)
         #f.input :decorate_company_id, as: :select, collection: options_for_select(DecorateCompany.all, DecorateCompany.all().first)

         f.input :picture, :as => :file, :hint => image_tag(f.object.picture, width:"50%")

       end
       f.buttons
   end

   show do |cs|
     attributes_table do
       row :id
       row :title
       row :decorate_company
       row :picture do
         image_tag(cs.picture)
       end
       row :created_at
       row :updated_at
     end
     active_admin_comments
   end

end
