require 'test_helper'

class CustomGoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get custom_goals_new_url
    assert_response :success
  end

  test "should get show" do
    get custom_goals_show_url
    assert_response :success
  end

  test "should get edit" do
    get custom_goals_edit_url
    assert_response :success
  end

end
