# encoding: UTF-8
ActiveAdmin.register MainMaterialName do
  menu :priority => 2, :parent =>  I18n.t('admin.menu.quotation_management')

  form do |f|
    f.inputs MainMaterialName.model_name.human do
      f.input :name
      f.inputs do
        f.has_many :main_material_name_sub_categories, :allow_destroy => true, :heading => '二级分类', :new_record => true do |sb|
          sb.input :name
        end
      end
    end

    f.actions
  end

  show do |main_material_name|
    attributes_table do
      row :id
      row :name
      main_material_name.main_material_name_sub_categories.each_with_index do |x,index|
        row "二级分类名称##{index+1}" do
          content_tag('p', x.name)
        end
      end

      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    column :id
    column :name
    column '二级分类名称' do  |main_material_name|
      content_html=''
      main_material_name.main_material_name_sub_categories.each_with_index do |x,index|
        content_html+="##{index+1} #{x.name}<br/>"
      end
        content_tag('p', content_html.html_safe)
    end
    #column :created_at
    #column :updated_at
    actions
  end
end
