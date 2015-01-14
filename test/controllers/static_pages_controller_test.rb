require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get go" do
    get :go
    assert_response :success
  end

  test "should get stop" do
    get :stop
    assert_response :success
  end

  test "should get log" do
    get :log
    assert_response :success
  end

  test "should get confirm" do
    get :confirm
    assert_response :success
  end

end
