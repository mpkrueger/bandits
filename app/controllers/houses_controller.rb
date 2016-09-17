class HousesController < ApplicationController
  def new
  	@house = House.new
  	@vote = Vote.new
  end

  def show
  end

  def edit
  end
end
