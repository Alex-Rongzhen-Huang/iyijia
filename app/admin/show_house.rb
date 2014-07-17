# encoding: UTF-8

ActiveAdmin.register ShowHouse do
  menu :priority => 3, :parent =>  I18n.t("admin.menu.show_house_management")
#  menu :priority => 3, :label => proc{ I18n.t("admin.show_houses") }
#  breadcrumb do
#    [
#        link_to(I18n.t("active_admin.dashboard"), '/admin'),
#        link_to(I18n.t("admin.show_houses"), '/admin/show_houses'),
#    ]
#  end

  # 嵌套式的结构
  #sidebar I18n.t("admin.show_house.details"), only: [:show, :edit] do
  #  ul do
  #    li link_to(I18n.t("admin.show_house_pictures"), admin_show_house_show_house_pictures_path(show_house))
  #  end
  #end

  sidebar ShowHousePicture.model_name.human, only: [:show, :edit] do
    ul do
      li link_to(ShowHousePicture.model_name.human, admin_show_house_pictures_path)

    end
    div do
      ul do
        show_house.show_house_pictures.each do |x|
          li link_to(image_tag(x.path, :width => "160px"), edit_admin_show_house_picture_path(x.id))
        end
      end

    end
  end

  form(:html => { :multipart=>true}) do |f|
    f.inputs ShowHouse.model_name.human do
      f.input :title
      f.input :decorate_company_id, as: :select, collection: DecorateCompany.all()
      #f.input :area
      #f.input :house_type, :as => :select, collection:  ShowHouse::HOUSE_TYPES
      #f.input :bedroom, :as => :select, collection:  options_for_select(ShowHouse::ROOM_TYPES, f.object.bedroom.nil? ? ShowHouse::ROOM_TYPES.first : f.object.bedroom)
      #f.input :livingroom, :as => :select, collection: options_for_select(ShowHouse::ROOM_TYPES, f.object.livingroom.nil? ? ShowHouse::ROOM_TYPES.first : f.object.livingroom)
      #f.input :bathroom, :as => :select, collection: options_for_select(ShowHouse::ROOM_TYPES, f.object.bathroom.nil? ? ShowHouse::ROOM_TYPES.first : f.object.bathroom)
      #f.input :price, :input_html => { :maxlength => 10 }, :hint => content_tag(:span,"价格 元")
      f.inputs do
        "
<br>
<label for='show_house_area' style='margin-left:-26%;'>面积<abbr title='required'>*</abbr></label>
<input id='show_house_area' maxlength='10' name='show_house[area]' value='#{f.object.area}' type='text' style='width: 10%;'> m<sup style='top: -0.5em;position: relative;font-size: 75%;line-height: 0;vertical-align: baseline;'>2</sup>
    <br><br>
<label for='show_house_price' style='margin-left:-26%;'>房型<abbr title='required'>*</abbr></label>
<select id='show_house_bedroom' name='show_house[bedroom]'><option value=''></option>
<option value='一' #{f.object.bedroom=='一'?'selected=\'selected\'':''} >一</option>
<option value='二' #{f.object.bedroom=='二'?'selected=\'selected\'':''} >二</option>
<option value='三' #{f.object.bedroom=='三'?'selected=\'selected\'':''} >三</option>
<option value='四' #{f.object.bedroom=='四'?'selected=\'selected\'':''} >四</option>
<option value='五' #{f.object.bedroom=='五'?'selected=\'selected\'':''} >五</option>
<option value='六' #{f.object.bedroom=='六'?'selected=\'selected\'':''} >六</option>
<option value='七' #{f.object.bedroom=='七'?'selected=\'selected\'':''} >七</option>
<option value='八' #{f.object.bedroom=='八'?'selected=\'selected\'':''} >八</option>
<option value='九' #{f.object.bedroom=='九'?'selected=\'selected\'':''} >九</option></select>&nbsp; 房&nbsp;&nbsp;
<select id='show_house_livingroom' name='show_house[livingroom]'><option value=''></option>
<option value='一' #{f.object.livingroom=='一'?'selected=\'selected\'':''} >一</option>
<option value='二' #{f.object.livingroom=='二'?'selected=\'selected\'':''} >二</option>
<option value='三' #{f.object.livingroom=='三'?'selected=\'selected\'':''} >三</option>
<option value='四' #{f.object.livingroom=='四'?'selected=\'selected\'':''} >四</option>
<option value='五' #{f.object.livingroom=='五'?'selected=\'selected\'':''} >五</option>
<option value='六' #{f.object.livingroom=='六'?'selected=\'selected\'':''} >六</option>
<option value='七' #{f.object.livingroom=='七'?'selected=\'selected\'':''} >七</option>
<option value='八' #{f.object.livingroom=='八'?'selected=\'selected\'':''} >八</option>
<option value='九' #{f.object.livingroom=='九'?'selected=\'selected\'':''} >九</option></select>&nbsp; 厅&nbsp;&nbsp;
<select id='show_house_bathroom' name='show_house[bathroom]'><option value=''></option>
<option value='一' #{f.object.bathroom=='一'?'selected=\'selected\'':''} >一</option>
<option value='二' #{f.object.bathroom=='二'?'selected=\'selected\'':''} >二</option>
<option value='三' #{f.object.bathroom=='三'?'selected=\'selected\'':''} >三</option>
<option value='四' #{f.object.bathroom=='四'?'selected=\'selected\'':''} >四</option>
<option value='五' #{f.object.bathroom=='五'?'selected=\'selected\'':''} >五</option>
<option value='六' #{f.object.bathroom=='六'?'selected=\'selected\'':''} >六</option>
<option value='七' #{f.object.bathroom=='七'?'selected=\'selected\'':''} >七</option>
<option value='八' #{f.object.bathroom=='八'?'selected=\'selected\'':''} >八</option>
<option value='九' #{f.object.bathroom=='九'?'selected=\'selected\'':''} >九</option></select>&nbsp; 卫&nbsp;&nbsp;
        <br><br>
        <label for='show_house_price' style='margin-left:-26%;'>最低造价<abbr title='required'>*</abbr></label>
<input id='show_house_price' maxlength='10' name='show_house[price]' value='#{f.object.price}' type='text' style='width: 10%;'>&nbsp;元 <br><br>"
        .html_safe
      end
      f.input :style, :as => :select, collection: ShowHouse::STYLE_TYPES

      f.input :usage, :as => :select, collection: ShowHouse::USAGE_TYPES



      f.input :brief, :as => :ckeditor
      f.input :overview, :as => :ckeditor
      f.input :need_to_know, :as => :ckeditor

      f.inputs do
        f.has_many :show_house_pictures, :allow_destroy => true, :heading => 'Pictures', :new_record => true do |cf|
          cf.input :path, :as => :file , :hint => image_tag(cf.object.path, width:"50%")
          cf.input :brief

        end
      end

      f.input :main_material_brand_ids, as: :select, collection: MainMaterialBrand.all, multiple: true

    end

    f.actions
  end


  index do
    selectable_column
    column :id
    #column I18n.t("admin.show_house_picture.path"), :path
    column :title
    column :decorate_company
    column :house_type
    column :area

    column :price
    column :style
    column :usage

    column :updated_at

    actions
  end
end
