require 'test_helper'

class MainMaterialsControllerTest < ActionController::TestCase
  setup do
    @main_material = main_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:main_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create main_material" do
    assert_difference('MainMaterial.count') do
      post :create, main_material: { decorate_company: @main_material.decorate_company, main_material_brand: @main_material.main_material_brand, name: @main_material.name, picture: @main_material.picture, price: @main_material.price, type: @main_material.type, type_of_work: @main_material.type_of_work }
    end

    assert_redirected_to main_material_path(assigns(:main_material))
  end

  test "should show main_material" do
    get :show, id: @main_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @main_material
    assert_response :success
  end

  test "should update main_material" do
    put :update, id: @main_material, main_material: { decorate_company: @main_material.decorate_company, main_material_brand: @main_material.main_material_brand, name: @main_material.name, picture: @main_material.picture, price: @main_material.price, type: @main_material.type, type_of_work: @main_material.type_of_work }
    assert_redirected_to main_material_path(assigns(:main_material))
  end

  test "should destroy main_material" do
    assert_difference('MainMaterial.count', -1) do
      delete :destroy, id: @main_material
    end

    assert_redirected_to main_materials_path
  end
end
