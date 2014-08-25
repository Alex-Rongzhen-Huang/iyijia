//= require active_admin/base
//for main_materials_form_page dynamic_select---------------------------------------------------------------------->
$(document).ready(function () {

    // 根据选择的主材名称，过滤主材品牌信息
    var $brands = $('#main_material_main_material_brand_id').html();
    $('#main_material_main_material_name_id').change(function () {
        var $name = $('#main_material_main_material_name_id :selected').text();
        var $options = $($brands).filter("optgroup[label = '" + $name + "']").html();
        if ($options) {
            $('#main_material_main_material_brand_id').html($options);
        }
        else {
            alert("'" + $name + "'暂无相关品牌，请先维护品牌信息");
            $('#main_material_main_material_brand_id').empty();
        }
    });

    // 更具选择的主材名称，过滤具体主材信息
    var $main_matrials = $('#main_material_package_main_material_id').html();
    $('#main_material_package_main_material_name_id').change(function () {
        var $name = $('#main_material_package_main_material_name_id :selected').text();
        console.log($name);
        var $options = $($main_matrials).filter("optgroup[label = '" + $name + "']").html();
        if ($options) {
            $('#main_material_package_main_material_id').html($options);
        }
        else {
            alert("'" + $name + "'暂无相关主材，请先维护具体主材信息");
            // 不清空，恢复默认列表
            $('#main_material_package_main_material_id').html($main_matrials);
        }
    });

});