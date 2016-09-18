class CollegesController < ApplicationController
  def new
  	@college = College.new
  	@vote = Vote.new
  end

  def show
  end

  def edit
  end
end
