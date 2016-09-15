class TripsController < ApplicationController
  def new
  	@trip = Trip.new
  end

  def create
  	@trip = Trip.new(params.require(:trip).permit(:place, :duration, :date, :trip_date, :flight_cost, :hotel_cost, :fun_cost))
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
    @comments = @goal.comments
    @to_do = ToDo.new
    @to_dos = @goal.to_dos

    # image search
    @image_options = {}
    @image_options[:searchType] = "image"
    @image_options[:imgSize] = "xlarge"
    @images = []
    @results = GoogleCustomSearchApi.search(@trip.place, @image_options)

    # filter to keep images where height < width
    @results.items.each do |result|
      height = result["image"]["height"]
      width = result["image"]["width"]
      if height < width
        @images.push result
      end
    end
    

    if (current_user.sent_invites.count != 0)
      @partner_name = current_user.sent_invites.first.first_name
    elsif (current_user.sent_invites.count == 0)
      @partner_name = "your partner"
    end

  end

  def edit
  end
end
