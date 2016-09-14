require 'test_helper'

class ToDosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get to_dos_index_url
    assert_response :success
  end

  test "should get new" do
    get to_dos_new_url
    assert_response :success
  end

  test "should get show" do
    get to_dos_show_url
    assert_response :success
  end

  test "should get edit" do
    get to_dos_edit_url
    assert_response :success
  end

end
