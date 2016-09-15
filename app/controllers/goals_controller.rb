class GoalsController < ApplicationController
  def selection
  end

  def new
  	@goal = Goal.new
  end

  def create
  	@goal = Goal.new
  	@goal.save
  end

  def show
  end
end
