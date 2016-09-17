class VotesController < ApplicationController
	def new
		@vote = Vote.new
	end

	def create
		@vote = Vote.new(params.require(:vote).permit(:voting_for, :want_this, :comment))
		@vote.user = current_user
		if @vote.save
			redirect_to root_path
		else
			flash[:error] = "uh oh that didn't work"
		end
	end
end
