require 'test_helper'

class InviteMailerTest < ActionMailer::TestCase
  test "new_user_invite" do
    mail = InviteMailer.new_user_invite
    assert_equal "New user invite", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "existing_user_invite" do
    mail = InviteMailer.existing_user_invite
    assert_equal "Existing user invite", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
