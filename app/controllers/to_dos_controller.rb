class ToDosController < ApplicationController
  def new
  	@to_do = ToDo.new
  end

  def create
  	@to_do = ToDo.new(todo_params)
  	@to_do.user = current_user
  	@to_do.goal = Goal.find_by_id(params[:to_do][:goal_id].to_i)
  	@goal_id = @to_do.goal.id
    if @to_do.save
  	else
  		flash[:error] = "uh oh"
  	end

  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  def show
  end

  def edit
  end

  def update
    @to_do = ToDo.find(params[:id])
    @to_do.update(completed: params[:completed])
    render text: 'ok'
  end

  private

  def todo_params
  	params.require(:to_do).permit(:item, :assignee, :goal_id, :completed)
  end
end
