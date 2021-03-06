# encoding: UTF-8
ActiveAdmin.register DecorateScheme do
  menu :priority => 3, :parent =>  I18n.t("admin.menu.decorate_company_management")

  form(:html => { :multipart=>true}) do |f|
    f.inputs DecorateScheme.model_name.human do
      f.input :name
      f.input :order_id, as: :select, collection: Order.all()
      f.input :confirm_status, as: :select, collection: DecorateScheme::CONFIRM_STATUS

      f.inputs do
        f.has_many :decorate_scheme_items, :allow_destroy => true, :heading => 'Pictures', :new_record => true do |cf|
          cf.input :path, :as => :file , :hint => image_tag(cf.object.path, width:"50%")
          cf.input :description

        end
      end

    end

    f.actions
  end

  show do |decorate_scheme|
    attributes_table do
      row :id
      row :name
      row :order

      decorate_scheme.decorate_scheme_items.each_with_index do |x,index|
        row "#{x.description.blank? ? '未命名':x.description}" do
          link_to(image_tag(x.path, :width => "500px"), edit_admin_decorate_scheme_path(decorate_scheme.id))
        end
      end

      row :created_at
      row :updated_at
    end
    active_admin_comments
  end


  index do
    selectable_column
    column :id
    #column I18n.t("admin.show_house_picture.path"), :path
    column :name
    column :order
    column :confirm_status do |cs|
      status_tag(cs.confirm_status, cs.confirm_status=='未确认'?:orange : :green)
    end
    column :created_at
    column :updated_at

    actions
  end




end
