require 'test_helper'

class ShowHousePicturesControllerTest < ActionController::TestCase
  setup do
    @show_house_picture = show_house_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:show_house_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create show_house_picture" do
    assert_difference('ShowHousePicture.count') do
      post :create, show_house_picture: { brief: @show_house_picture.brief, description: @show_house_picture.description, path: @show_house_picture.path }
    end

    assert_redirected_to show_house_picture_path(assigns(:show_house_picture))
  end

  test "should show show_house_picture" do
    get :show, id: @show_house_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @show_house_picture
    assert_response :success
  end

  test "should update show_house_picture" do
    put :update, id: @show_house_picture, show_house_picture: { brief: @show_house_picture.brief, description: @show_house_picture.description, path: @show_house_picture.path }
    assert_redirected_to show_house_picture_path(assigns(:show_house_picture))
  end

  test "should destroy show_house_picture" do
    assert_difference('ShowHousePicture.count', -1) do
      delete :destroy, id: @show_house_picture
    end

    assert_redirected_to show_house_pictures_path
  end
end
