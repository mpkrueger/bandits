class UpdateMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.update_mailer.new_goal_update.subject
  #
  def new_goal_update(user)
    @user = user

    mail to: @user.my_partner_email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.update_mailer.new_comment_update.subject
  #
  def new_comment_update
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.update_mailer.new_to_do_update.subject
  #
  def new_to_do_update
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.update_mailer.goal_complete_update.subject
  #
  def goal_complete_update
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.update_mailer.partner_joined_update.subject
  #
  def partner_joined_update
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
