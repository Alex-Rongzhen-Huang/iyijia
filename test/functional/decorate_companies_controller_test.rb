require 'test_helper'

class DecorateCompaniesControllerTest < ActionController::TestCase
  setup do
    @decorate_company = decorate_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:decorate_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create decorate_company" do
    assert_difference('DecorateCompany.count') do
      post :create, decorate_company: { brief: @decorate_company.brief, name: @decorate_company.name }
    end

    assert_redirected_to decorate_company_path(assigns(:decorate_company))
  end

  test "should show decorate_company" do
    get :show, id: @decorate_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @decorate_company
    assert_response :success
  end

  test "should update decorate_company" do
    put :update, id: @decorate_company, decorate_company: { brief: @decorate_company.brief, name: @decorate_company.name }
    assert_redirected_to decorate_company_path(assigns(:decorate_company))
  end

  test "should destroy decorate_company" do
    assert_difference('DecorateCompany.count', -1) do
      delete :destroy, id: @decorate_company
    end

    assert_redirected_to decorate_companies_path
  end
end
