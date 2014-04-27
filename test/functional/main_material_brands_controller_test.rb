require 'test_helper'

class MainMaterialBrandsControllerTest < ActionController::TestCase
  setup do
    @main_material_brand = main_material_brands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:main_material_brands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create main_material_brand" do
    assert_difference('MainMaterialBrand.count') do
      post :create, main_material_brand: { logo_path: @main_material_brand.logo_path, name: @main_material_brand.name }
    end

    assert_redirected_to main_material_brand_path(assigns(:main_material_brand))
  end

  test "should show main_material_brand" do
    get :show, id: @main_material_brand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @main_material_brand
    assert_response :success
  end

  test "should update main_material_brand" do
    put :update, id: @main_material_brand, main_material_brand: { logo_path: @main_material_brand.logo_path, name: @main_material_brand.name }
    assert_redirected_to main_material_brand_path(assigns(:main_material_brand))
  end

  test "should destroy main_material_brand" do
    assert_difference('MainMaterialBrand.count', -1) do
      delete :destroy, id: @main_material_brand
    end

    assert_redirected_to main_material_brands_path
  end
end
