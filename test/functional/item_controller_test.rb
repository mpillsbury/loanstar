require 'test_helper'

class ItemControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get index_by_user" do
    get :index_by_user
    assert_response :success
  end

  test "should get requests_by_user" do
    get :requests_by_user
    assert_response :success
  end

  test "should get borrows_by_user" do
    get :borrows_by_user
    assert_response :success
  end

end
