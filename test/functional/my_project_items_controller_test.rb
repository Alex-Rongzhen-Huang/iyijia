require 'test_helper'

class MyProjectItemsControllerTest < ActionController::TestCase
  setup do
    @my_project_item = my_project_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_project_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_project_item" do
    assert_difference('MyProjectItem.count') do
      post :create, my_project_item: { description: @my_project_item.description, path: @my_project_item.path }
    end

    assert_redirected_to my_project_item_path(assigns(:my_project_item))
  end

  test "should show my_project_item" do
    get :show, id: @my_project_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_project_item
    assert_response :success
  end

  test "should update my_project_item" do
    put :update, id: @my_project_item, my_project_item: { description: @my_project_item.description, path: @my_project_item.path }
    assert_redirected_to my_project_item_path(assigns(:my_project_item))
  end

  test "should destroy my_project_item" do
    assert_difference('MyProjectItem.count', -1) do
      delete :destroy, id: @my_project_item
    end

    assert_redirected_to my_project_items_path
  end
end
