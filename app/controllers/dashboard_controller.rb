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

	    if (@family_members < 2 && current_user.sent_invites.present?)
	      @partner_name = current_user.sent_invites.first.first_name
	    elsif (@family_members >= 2)
	    	@partner_name =  
	    		@family.users.where([':first_name <> ?', current_user.first_name]).first.first_name

	    else
	      @partner_name = "your partner"
		end

	end
  end
end
