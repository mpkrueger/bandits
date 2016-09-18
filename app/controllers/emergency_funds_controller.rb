class EmergencyFundsController < ApplicationController
  def new
  	@emergency_fund = EmergencyFund.new
  	@vote = Vote.new
  end

  def show
  end

  def edit
  end
end
