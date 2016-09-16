# Preview all emails at http://localhost:3000/rails/mailers/update_mailer
class UpdateMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/update_mailer/new_goal_update
  def new_goal_update
    UpdateMailer.new_goal_update
  end

  # Preview this email at http://localhost:3000/rails/mailers/update_mailer/new_comment_update
  def new_comment_update
    UpdateMailer.new_comment_update
  end

  # Preview this email at http://localhost:3000/rails/mailers/update_mailer/new_to_do_update
  def new_to_do_update
    UpdateMailer.new_to_do_update
  end

  # Preview this email at http://localhost:3000/rails/mailers/update_mailer/goal_complete_update
  def goal_complete_update
    UpdateMailer.goal_complete_update
  end

  # Preview this email at http://localhost:3000/rails/mailers/update_mailer/partner_joined_update
  def partner_joined_update
    UpdateMailer.partner_joined_update
  end

end
