class InvitesController < ApplicationController
  def new
    @invite = Invite.new
  end

  def create
  	@invite = Invite.new(invite_params)
  	@invite.sender_id = current_user.id
  	if @invite.save
  		InviteMailer.new_user_invite(@invite, new_user_registration_path(invite_token: @invite.token)).deliver
  	else
  		# uh oh
  	end
  end
end
