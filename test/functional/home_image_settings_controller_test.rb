require 'test_helper'

class HomeImageSettingsControllerTest < ActionController::TestCase
  setup do
    @home_image_setting = home_image_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:home_image_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create home_image_setting" do
    assert_difference('HomeImageSetting.count') do
      post :create, home_image_setting: { img1: @home_image_setting.img1, img2: @home_image_setting.img2, img3: @home_image_setting.img3, img4: @home_image_setting.img4, img5: @home_image_setting.img5 }
    end

    assert_redirected_to home_image_setting_path(assigns(:home_image_setting))
  end

  test "should show home_image_setting" do
    get :show, id: @home_image_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @home_image_setting
    assert_response :success
  end

  test "should update home_image_setting" do
    put :update, id: @home_image_setting, home_image_setting: { img1: @home_image_setting.img1, img2: @home_image_setting.img2, img3: @home_image_setting.img3, img4: @home_image_setting.img4, img5: @home_image_setting.img5 }
    assert_redirected_to home_image_setting_path(assigns(:home_image_setting))
  end

  test "should destroy home_image_setting" do
    assert_difference('HomeImageSetting.count', -1) do
      delete :destroy, id: @home_image_setting
    end

    assert_redirected_to home_image_settings_path
  end
end
