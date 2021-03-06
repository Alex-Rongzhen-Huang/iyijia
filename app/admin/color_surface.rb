ActiveAdmin.register ColorSurface do
  menu :priority => 2, :parent =>  I18n.t("admin.menu.show_house_management")
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
         f.input :picture2, :as => :file, :hint => image_tag(f.object.picture2, width:"50%")
         f.input :picture3, :as => :file, :hint => image_tag(f.object.picture3, width:"50%")
         f.input :picture4, :as => :file, :hint => image_tag(f.object.picture4, width:"50%")
         f.input :picture5, :as => :file, :hint => image_tag(f.object.picture5, width:"50%")

       end
       f.actions
   end

   show do |cs|
     attributes_table do
       row :id
       row :title
       row :decorate_company
       row :picture do
         image_tag(cs.picture)
       end
       row :picture2 do
         image_tag(cs.picture2)
       end
       row :picture3 do
         image_tag(cs.picture3)
       end
       row :picture4 do
         image_tag(cs.picture4)
       end
       row :picture5 do
         image_tag(cs.picture5)
       end
       row :created_at
       row :updated_at
     end
     active_admin_comments
   end

end
