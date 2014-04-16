require 'test_helper'

class ShowHousesControllerTest < ActionController::TestCase
  setup do
    @show_house = show_houses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:show_houses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create show_house" do
    assert_difference('ShowHouse.count') do
      post :create, show_house: { area: @show_house.area, brief: @show_house.brief, house_type: @show_house.house_type, need_to_know: @show_house.need_to_know, overview: @show_house.overview, price: @show_house.price, style: @show_house.style, title: @show_house.title }
    end

    assert_redirected_to show_house_path(assigns(:show_house))
  end

  test "should show show_house" do
    get :show, id: @show_house
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @show_house
    assert_response :success
  end

  test "should update show_house" do
    put :update, id: @show_house, show_house: { area: @show_house.area, brief: @show_house.brief, house_type: @show_house.house_type, need_to_know: @show_house.need_to_know, overview: @show_house.overview, price: @show_house.price, style: @show_house.style, title: @show_house.title }
    assert_redirected_to show_house_path(assigns(:show_house))
  end

  test "should destroy show_house" do
    assert_difference('ShowHouse.count', -1) do
      delete :destroy, id: @show_house
    end

    assert_redirected_to show_houses_path
  end
end
