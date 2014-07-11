require 'test_helper'

class MyProjectsControllerTest < ActionController::TestCase
  setup do
    @my_project = my_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_project" do
    assert_difference('MyProject.count') do
      post :create, my_project: { name: @my_project.name }
    end

    assert_redirected_to my_project_path(assigns(:my_project))
  end

  test "should show my_project" do
    get :show, id: @my_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_project
    assert_response :success
  end

  test "should update my_project" do
    put :update, id: @my_project, my_project: { name: @my_project.name }
    assert_redirected_to my_project_path(assigns(:my_project))
  end

  test "should destroy my_project" do
    assert_difference('MyProject.count', -1) do
      delete :destroy, id: @my_project
    end

    assert_redirected_to my_projects_path
  end
end
