require 'test_helper'

class FamiliesControllerTest < ActionDispatch::IntegrationTest
  test "should get invite" do
    get families_invite_url
    assert_response :success
  end

end
