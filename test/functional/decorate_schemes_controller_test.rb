require 'test_helper'

class DecorateSchemesControllerTest < ActionController::TestCase
  setup do
    @decorate_scheme = decorate_schemes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:decorate_schemes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create decorate_scheme" do
    assert_difference('DecorateScheme.count') do
      post :create, decorate_scheme: { name: @decorate_scheme.name }
    end

    assert_redirected_to decorate_scheme_path(assigns(:decorate_scheme))
  end

  test "should show decorate_scheme" do
    get :show, id: @decorate_scheme
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @decorate_scheme
    assert_response :success
  end

  test "should update decorate_scheme" do
    put :update, id: @decorate_scheme, decorate_scheme: { name: @decorate_scheme.name }
    assert_redirected_to decorate_scheme_path(assigns(:decorate_scheme))
  end

  test "should destroy decorate_scheme" do
    assert_difference('DecorateScheme.count', -1) do
      delete :destroy, id: @decorate_scheme
    end

    assert_redirected_to decorate_schemes_path
  end
end
