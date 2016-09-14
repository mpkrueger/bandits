require 'test_helper'

class CollegesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get colleges_new_url
    assert_response :success
  end

  test "should get show" do
    get colleges_show_url
    assert_response :success
  end

  test "should get edit" do
    get colleges_edit_url
    assert_response :success
  end

end
