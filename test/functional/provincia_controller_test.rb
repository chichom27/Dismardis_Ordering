require 'test_helper'

class ProvinciaControllerTest < ActionController::TestCase
  setup do
    @provincium = provincia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provincia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provincium" do
    assert_difference('Provincium.count') do
      post :create, provincium: @provincium.attributes
    end

    assert_redirected_to provincium_path(assigns(:provincium))
  end

  test "should show provincium" do
    get :show, id: @provincium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provincium
    assert_response :success
  end

  test "should update provincium" do
    put :update, id: @provincium, provincium: @provincium.attributes
    assert_redirected_to provincium_path(assigns(:provincium))
  end

  test "should destroy provincium" do
    assert_difference('Provincium.count', -1) do
      delete :destroy, id: @provincium
    end

    assert_redirected_to provincia_path
  end
end
