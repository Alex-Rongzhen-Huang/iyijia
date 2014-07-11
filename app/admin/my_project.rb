# encoding: UTF-8
ActiveAdmin.register MyProject do
  menu :priority => 4, :parent =>  I18n.t("admin.menu.decorate_company_management")
  
  form(:html => { :multipart=>true}) do |f|
    f.inputs MyProject.model_name.human do
      f.input :name
      f.input :order_id, as: :select, collection: Order.all()

      f.inputs do
        f.has_many :my_project_items, :allow_destroy => true, :heading => 'Pictures', :new_record => true do |cf|
          cf.input :path, :as => :file , :hint => image_tag(cf.object.path, width:"50%")
          cf.input :description

        end
      end

    end

    f.buttons
  end
  
  show do |my_project|
    attributes_table do
      row :id
      row :name
      row :order

      my_project.my_project_items.each_with_index do |x,index|
        row "#{x.description.blank? ? '未命名':x.description}" do
          link_to(image_tag(x.path, :width => "500px"), edit_admin_my_project_path(my_project.id))
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
    column :created_at
    column :updated_at

    default_actions
  end


end
