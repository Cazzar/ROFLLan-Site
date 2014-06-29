require 'test_helper'

class Admin::UserControllerTest < ActionController::TestCase
  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get ban" do
    get :ban
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
