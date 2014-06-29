require 'test_helper'

class Admin::LanControllerTest < ActionController::TestCase
  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get schedule" do
    get :schedule
    assert_response :success
  end

end
