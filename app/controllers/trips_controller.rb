class TripsController < ApplicationController
  def new
  	@trip = Trip.new
  end

  def create
  	@trip = Trip.new(params.require(:trip).permit(:place, :duration, :date, :flight_cost, :hotel_cost, :fun_cost))
  	@goal = Goal.new(family: current_user.family)
  	@trip.goal = @goal
  	if @trip.save
  		redirect_to root_path
  	else
  		flash[:error] = "uh oh"
  	end
  end

  def show
  end

  def edit
  end
end
