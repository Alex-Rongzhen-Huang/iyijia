//= require active_admin/base
//= require autocomplete-rails
//= require jquery-ui


//for main_materials_form_page dynamic_select---------------------------------------------------------------------->
$(document).ready(function() {
  var $brands = $('#main_material_main_material_brand_id').html();
  $('#main_material_main_material_name_id').change(function() {
  	var $name = $('#main_material_main_material_name_id :selected').text();
  	var $options = $($brands).filter("optgroup[label = '"+$name+"']").html();
  	if ($options){
  	  $('#main_material_main_material_brand_id').html($options);
  	}
  	else{
  	  alert("'"+$name+"'暂无相关品牌，请先维护品牌信息");
  	  $('#main_material_main_material_brand_id').empty();
  	}
  });
});