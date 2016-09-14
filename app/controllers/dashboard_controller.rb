class DashboardController < ApplicationController
  def index
  	@user = current_user
  	@family = @user.family
  	@family_members = @user.family.users.count
  end
end
