require 'test_helper'

class ColorSurfacesControllerTest < ActionController::TestCase
  setup do
    @color_surface = color_surfaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:color_surfaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create color_surface" do
    assert_difference('ColorSurface.count') do
      post :create, color_surface: { brief: @color_surface.brief, picture: @color_surface.picture }
    end

    assert_redirected_to color_surface_path(assigns(:color_surface))
  end

  test "should show color_surface" do
    get :show, id: @color_surface
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @color_surface
    assert_response :success
  end

  test "should update color_surface" do
    put :update, id: @color_surface, color_surface: { brief: @color_surface.brief, picture: @color_surface.picture }
    assert_redirected_to color_surface_path(assigns(:color_surface))
  end

  test "should destroy color_surface" do
    assert_difference('ColorSurface.count', -1) do
      delete :destroy, id: @color_surface
    end

    assert_redirected_to color_surfaces_path
  end
end
