require 'test_helper'

class AgenciaControllerTest < ActionController::TestCase
  setup do
    @agencium = agencia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agencium" do
    assert_difference('Agencium.count') do
      post :create, agencium: @agencium.attributes
    end

    assert_redirected_to agencium_path(assigns(:agencium))
  end

  test "should show agencium" do
    get :show, id: @agencium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agencium
    assert_response :success
  end

  test "should update agencium" do
    put :update, id: @agencium, agencium: @agencium.attributes
    assert_redirected_to agencium_path(assigns(:agencium))
  end

  test "should destroy agencium" do
    assert_difference('Agencium.count', -1) do
      delete :destroy, id: @agencium
    end

    assert_redirected_to agencia_path
  end
end
