require 'test_helper'

class LanControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get schedule" do
    get :schedule
    assert_response :success
  end

end
