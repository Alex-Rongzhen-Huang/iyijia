require 'test_helper'

class QuotationTemplatesControllerTest < ActionController::TestCase
  setup do
    @quotation_template = quotation_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quotation_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quotation_template" do
    assert_difference('QuotationTemplate.count') do
      post :create, quotation_template: {  }
    end

    assert_redirected_to quotation_template_path(assigns(:quotation_template))
  end

  test "should show quotation_template" do
    get :show, id: @quotation_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quotation_template
    assert_response :success
  end

  test "should update quotation_template" do
    put :update, id: @quotation_template, quotation_template: {  }
    assert_redirected_to quotation_template_path(assigns(:quotation_template))
  end

  test "should destroy quotation_template" do
    assert_difference('QuotationTemplate.count', -1) do
      delete :destroy, id: @quotation_template
    end

    assert_redirected_to quotation_templates_path
  end
end
