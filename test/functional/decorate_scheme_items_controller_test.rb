require 'test_helper'

class DecorateSchemeItemsControllerTest < ActionController::TestCase
  setup do
    @decorate_scheme_item = decorate_scheme_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:decorate_scheme_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create decorate_scheme_item" do
    assert_difference('DecorateSchemeItem.count') do
      post :create, decorate_scheme_item: { description: @decorate_scheme_item.description, path: @decorate_scheme_item.path }
    end

    assert_redirected_to decorate_scheme_item_path(assigns(:decorate_scheme_item))
  end

  test "should show decorate_scheme_item" do
    get :show, id: @decorate_scheme_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @decorate_scheme_item
    assert_response :success
  end

  test "should update decorate_scheme_item" do
    put :update, id: @decorate_scheme_item, decorate_scheme_item: { description: @decorate_scheme_item.description, path: @decorate_scheme_item.path }
    assert_redirected_to decorate_scheme_item_path(assigns(:decorate_scheme_item))
  end

  test "should destroy decorate_scheme_item" do
    assert_difference('DecorateSchemeItem.count', -1) do
      delete :destroy, id: @decorate_scheme_item
    end

    assert_redirected_to decorate_scheme_items_path
  end
end
