class InvitesController < ApplicationController
  def new
    @invite = Invite.new
    @invite.family_id = current_user.family_id
  end

  def create
  	@invite = Invite.new(invite_params)
  	@invite.sender_id = current_user.id
  	if @invite.save
  		InviteMailer.new_user_invite(@invite).deliver
      redirect_to root_path
  	else
  		# uh oh
  	end
  end

  private

  def invite_params
    params.require(:invite).permit(:family_id, :email, :first_name)
  end
end
