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
    // 根据选择的主材名称，过滤主材二级分类信息
    var $subs = $('#main_material_main_material_name_sub_category_id').html();
    $('#main_material_main_material_name_id').change(function () {
        var $name = $('#main_material_main_material_name_id :selected').text();
        var $options = $($subs).filter("optgroup[label = '" + $name + "']").html();
        if ($options) {
            $('#main_material_main_material_name_sub_category_id').html($options);
        }
        else {
            alert("'" + $name + "'暂无相关主材二级分类信息，如有需求请先编辑主材二级分类");
            $('#main_material_main_material_name_sub_category_id').html($subs);
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

    // 根据选择的主材名称，过滤主材二级分类信息
    var $subs = $('#main_material_package_main_material_name_sub_category_id').html();
    $('#main_material_package_main_material_name_id').change(function () {
        var $name = $('#main_material_package_main_material_name_id :selected').text();
        var $options = $($subs).filter("optgroup[label = '" + $name + "']").html();
        if ($options) {
            $('#main_material_package_main_material_name_sub_category_id').html($options);
        }
        else {
            alert("'" + $name + "'暂无相关主材二级分类信息，如有需求请先编辑主材二级分类");
            $('#main_material_package_main_material_name_sub_category_id').html($subs);
        }
    });


    // 报价单页面暂未支持，id太复杂

});