require 'test_helper'

class EmergencyFundsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get emergency_funds_new_url
    assert_response :success
  end

  test "should get show" do
    get emergency_funds_show_url
    assert_response :success
  end

  test "should get edit" do
    get emergency_funds_edit_url
    assert_response :success
  end

end
