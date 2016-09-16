class TripsController < ApplicationController
  def new
  	@trip = Trip.new
  end

  def create
  	@trip = Trip.new(params.require(:trip).permit(:place, :duration, :date, :trip_date, :flight_cost, :hotel_cost, :fun_cost))
  	@goal = Goal.new(family: current_user.family)
  	@trip.goal = @goal
  	if @trip.save
  		if current_user.family.users.count >= 2
        UpdateMailer.new_goal_update(current_user).deliver
      end
      redirect_to image_trip_path(@trip)
  	else
  		flash[:error] = "uh oh"
  	end
  end

  def update
    @trip = Trip.find_by_id(params[:id])
    if @trip.update_attributes(params.require(:trip).permit(:place, :duration, :date, :trip_date, :flight_cost, :hotel_cost, :fun_cost, :image))
      redirect_to summary_trip_path(@trip)
    else
      flash[:error] = "uh oh"
    end
  end

  def edit
    @trip = Trip.find_by_id(params[:id])
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
    @monthly_savings_goal = @total_cost/((@trip.date.year * 12 + @trip.date.month) - (DateTime.now.year*12 + DateTime.now.month))
    @months_left = (@trip.date.year * 12 + @trip.date.month) - (DateTime.now.year*12 + DateTime.now.month)
    

    if (current_user.sent_invites.count != 0)
      @partner_name = current_user.sent_invites.first.first_name
    elsif (current_user.sent_invites.count == 0)
      @partner_name = "your partner"
    end
  end

  def image
    @trip = Trip.find_by_id(params[:id])
    @goal = @trip.goal

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
    
    @image1 = @images[0].link
    @image2 = @images[1].link
    @image3 = @images[2].link
    @image4 = @images[3].link

    @image_links = []

    @images.each do |image|
      @image_links.push image.link
    end
  end

  def savings_feedback
    @trip = Trip.find_by_id(params[:id])
    @feedback = Feedback.new
  end
end
