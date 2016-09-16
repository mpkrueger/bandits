class FeedbacksController < ApplicationController

	def new
		@feedback = Feedback.new
	end

	def create
		@feedback = Feedback.new(params.require(:feedback).permit(:thoughts, approach: []))
		@feedback.user = current_user
		@trip = Trip.find_by_id(params[:trip_id])
		@feedback.goal = @trip.goal

		if @feedback.save
			redirect_to summary_trip_path(@trip)
		else
			flash[:error] = "uh oh"
		end
	end

end
