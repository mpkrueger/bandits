class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.new_user_invite.subject
  #
  def new_user_invite(invite)

    @greeting = "Hi"
    @invite = invite

    @user = User.find_by_id(invite.sender_id)
    @subject = @user.first_name + " invites you to join Savvy to set up savings goals together" 

    mail(to: @invite.email, subject: @subject)

    # @new_reg_url = new_user_registration_url(:invite_token => @invite.token)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.existing_user_invite.subject
  #
  def existing_user_invite
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
