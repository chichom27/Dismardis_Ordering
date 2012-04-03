require 'test_helper'

class FamiliaControllerTest < ActionController::TestCase
  setup do
    @familium = familia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:familia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create familium" do
    assert_difference('Familium.count') do
      post :create, familium: @familium.attributes
    end

    assert_redirected_to familium_path(assigns(:familium))
  end

  test "should show familium" do
    get :show, id: @familium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @familium
    assert_response :success
  end

  test "should update familium" do
    put :update, id: @familium, familium: @familium.attributes
    assert_redirected_to familium_path(assigns(:familium))
  end

  test "should destroy familium" do
    assert_difference('Familium.count', -1) do
      delete :destroy, id: @familium
    end

    assert_redirected_to familia_path
  end
end
