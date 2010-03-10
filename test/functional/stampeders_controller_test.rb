require 'test_helper'

class StampedersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stampeders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stampeder" do
    assert_difference('Stampeder.count') do
      post :create, :stampeder => { }
    end

    assert_redirected_to stampeder_path(assigns(:stampeder))
  end

  test "should show stampeder" do
    get :show, :id => stampeders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => stampeders(:one).to_param
    assert_response :success
  end

  test "should update stampeder" do
    put :update, :id => stampeders(:one).to_param, :stampeder => { }
    assert_redirected_to stampeder_path(assigns(:stampeder))
  end

  test "should destroy stampeder" do
    assert_difference('Stampeder.count', -1) do
      delete :destroy, :id => stampeders(:one).to_param
    end

    assert_redirected_to stampeders_path
  end
end
