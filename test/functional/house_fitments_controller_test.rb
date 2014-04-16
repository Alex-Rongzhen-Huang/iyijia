require 'test_helper'

class HouseFitmentsControllerTest < ActionController::TestCase
  setup do
    @house_fitment = house_fitments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:house_fitments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create house_fitment" do
    assert_difference('HouseFitment.count') do
      post :create, house_fitment: { address: @house_fitment.address, contact: @house_fitment.contact, phone: @house_fitment.phone }
    end

    assert_redirected_to house_fitment_path(assigns(:house_fitment))
  end

  test "should show house_fitment" do
    get :show, id: @house_fitment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @house_fitment
    assert_response :success
  end

  test "should update house_fitment" do
    put :update, id: @house_fitment, house_fitment: { address: @house_fitment.address, contact: @house_fitment.contact, phone: @house_fitment.phone }
    assert_redirected_to house_fitment_path(assigns(:house_fitment))
  end

  test "should destroy house_fitment" do
    assert_difference('HouseFitment.count', -1) do
      delete :destroy, id: @house_fitment
    end

    assert_redirected_to house_fitments_path
  end
end
