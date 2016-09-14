class CommentsController < ApplicationController
  def index
  end

  def new
  	@comment = Comment.new
  end

  def create
  	@comment = Comment.new(comment_params)
  	@comment.user = current_user
    @comment.goal = Goal.find_by_id(params[:comment][:goal_id].to_i)
  	if @comment.save
  		flash[:notice] = "saved"
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

  private

  def comment_params
    params.require(:comment).permit(:message, :goal_id)
  end
end
