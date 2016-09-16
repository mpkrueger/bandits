require 'test_helper'

class UpdateMailerTest < ActionMailer::TestCase
  test "new_goal_update" do
    mail = UpdateMailer.new_goal_update
    assert_equal "New goal update", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "new_comment_update" do
    mail = UpdateMailer.new_comment_update
    assert_equal "New comment update", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "new_to_do_update" do
    mail = UpdateMailer.new_to_do_update
    assert_equal "New to do update", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "goal_complete_update" do
    mail = UpdateMailer.goal_complete_update
    assert_equal "Goal complete update", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "partner_joined_update" do
    mail = UpdateMailer.partner_joined_update
    assert_equal "Partner joined update", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
