require 'test_helper'

class QuotationTemplateItemsControllerTest < ActionController::TestCase
  setup do
    @quotation_template_item = quotation_template_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quotation_template_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quotation_template_item" do
    assert_difference('QuotationTemplateItem.count') do
      post :create, quotation_template_item: { construction_item_number: @quotation_template_item.construction_item_number, labour_cost: @quotation_template_item.labour_cost, labour_cost_total: @quotation_template_item.labour_cost_total, main_material_total_price: @quotation_template_item.main_material_total_price, note: @quotation_template_item.note, supplementary_material_price: @quotation_template_item.supplementary_material_price, supplementary_material_total_price: @quotation_template_item.supplementary_material_total_price, supplementary_material_type: @quotation_template_item.supplementary_material_type, total_price: @quotation_template_item.total_price }
    end

    assert_redirected_to quotation_template_item_path(assigns(:quotation_template_item))
  end

  test "should show quotation_template_item" do
    get :show, id: @quotation_template_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quotation_template_item
    assert_response :success
  end

  test "should update quotation_template_item" do
    put :update, id: @quotation_template_item, quotation_template_item: { construction_item_number: @quotation_template_item.construction_item_number, labour_cost: @quotation_template_item.labour_cost, labour_cost_total: @quotation_template_item.labour_cost_total, main_material_total_price: @quotation_template_item.main_material_total_price, note: @quotation_template_item.note, supplementary_material_price: @quotation_template_item.supplementary_material_price, supplementary_material_total_price: @quotation_template_item.supplementary_material_total_price, supplementary_material_type: @quotation_template_item.supplementary_material_type, total_price: @quotation_template_item.total_price }
    assert_redirected_to quotation_template_item_path(assigns(:quotation_template_item))
  end

  test "should destroy quotation_template_item" do
    assert_difference('QuotationTemplateItem.count', -1) do
      delete :destroy, id: @quotation_template_item
    end

    assert_redirected_to quotation_template_items_path
  end
end
