class TripsController < ApplicationController
  def new
  	@trip = Trip.new
  end

  def create
  	@trip = Trip.new(params.require(:trip).permit(:place, :duration, :date, :flight_cost, :hotel_cost, :fun_cost))
  	@goal = Goal.new(family: current_user.family)
  	@trip.goal = @goal
  	if @trip.save
  		redirect_to summary_trip_path(@trip)
  	else
  		flash[:error] = "uh oh"
  	end
  end

  def summary
    @trip = Trip.find_by_id(params[:id])
    @goal = @trip.goal
    @goal_id = @goal.id
    @total_cost = @trip.flight_cost + (@trip.hotel_cost * @trip.duration) + (@trip.fun_cost * @trip.duration)
    @comment = Comment.new
    @comments = @trip.goal.comments
  end

  def edit
  end
end
