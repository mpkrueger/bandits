class GoalsController < ApplicationController
  def index
  end

  def new
  	@goal = Goal.new
  end

  def create
  	@goal = Goal.new
  	@goal.save
  end
end
