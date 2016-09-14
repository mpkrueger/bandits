class DashboardController < ApplicationController
  def index
  	@user = current_user
  	if current_user != nil
	  	@family = @user.family
	  	@family_members = @user.family.users.count
	  	@family_goals = @user.family.goals
	  end
  end
end
