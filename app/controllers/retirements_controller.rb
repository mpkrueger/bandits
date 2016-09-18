class RetirementsController < ApplicationController
  def new
  	@retirement = Retirement.new
  	@vote = Vote.new
  end

  def show
  end

  def edit
  end
end
