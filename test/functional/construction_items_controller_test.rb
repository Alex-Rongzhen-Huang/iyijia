require 'test_helper'

class ConstructionItemsControllerTest < ActionController::TestCase
  setup do
    @construction_item = construction_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:construction_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create construction_item" do
    assert_difference('ConstructionItem.count') do
      post :create, construction_item: { name: @construction_item.name, process_description: @construction_item.process_description, type_of_work: @construction_item.type_of_work, unit: @construction_item.unit }
    end

    assert_redirected_to construction_item_path(assigns(:construction_item))
  end

  test "should show construction_item" do
    get :show, id: @construction_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @construction_item
    assert_response :success
  end

  test "should update construction_item" do
    put :update, id: @construction_item, construction_item: { name: @construction_item.name, process_description: @construction_item.process_description, type_of_work: @construction_item.type_of_work, unit: @construction_item.unit }
    assert_redirected_to construction_item_path(assigns(:construction_item))
  end

  test "should destroy construction_item" do
    assert_difference('ConstructionItem.count', -1) do
      delete :destroy, id: @construction_item
    end

    assert_redirected_to construction_items_path
  end
end
