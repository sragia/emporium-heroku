require 'test_helper'

class CheckoutControllerTest < ActionController::TestCase
  test "should get personInfo" do
    get :personInfo
    assert_response :success
  end

  test "should get shipping" do
    get :shipping
    assert_response :success
  end

  test "should get check" do
    get :check
    assert_response :success
  end

  test "should get confirm" do
    get :confirm
    assert_response :success
  end

end
