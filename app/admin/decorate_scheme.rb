ActiveAdmin.register DecorateScheme do
  menu :priority => 3, :parent =>  I18n.t("admin.menu.decorate_company_management")

  form(:html => { :multipart=>true}) do |f|
    f.inputs DecorateScheme.model_name.human do
      f.input :name
      f.input :order_id, as: :select, collection: Order.all()

      f.inputs do
        f.has_many :decorate_scheme_items, :allow_destroy => true, :heading => 'Pictures', :new_record => true do |cf|
          cf.input :path, :as => :file , :hint => image_tag(cf.object.path, width:"50%")
          cf.input :description

        end
      end

    end

    f.buttons
  end

  show do |decorate_scheme|
    attributes_table do
      row :id
      row :name

      decorate_scheme.decorate_scheme_items.each_with_index do |x,index|
        row "#{x.description}" do
          link_to(image_tag(x.path, :width => "500px"), edit_admin_decorate_scheme_path(decorate_scheme.id))
        end
      end

      row :created_at
      row :updated_at
    end
    active_admin_comments
  end




end
