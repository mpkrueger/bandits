class DashboardController < ApplicationController
  def index
  	@user = current_user
  	if current_user != nil
	  	@family = @user.family
	  	@family_members = @user.family.users.count
	  	@family_goals = @user.family.goals

	  	@family_goals.each do |goal|
		  	if(goal.trips.present?)
		  		@trip = goal.trips.first
		  		@tripcost =  @trip.flight_cost + (@trip.hotel_cost * @trip.duration) + (@trip.fun_cost * @trip.duration)

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
		  	end
	  	end

	  	@partner_name = current_user.my_partner_name

		end
  end
end
