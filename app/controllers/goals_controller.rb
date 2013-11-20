class GoalsController < ApplicationController
  before_filter :must_be_logged_in, only: [:new, :create]
  before_filter :require_user_with_permission, only: [:show]
  before_filter :require_owner, only: [:edit, :update, :destroy, :mark_completed]

  def index
    if logged_in?
      @goals = Goal.where("goals.is_private='f' OR goals.user_id=?", current_user.id)
    else
      @goals = Goal.where(is_private: false)
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(params[:goal])

    if @goal.save
      redirect_to @goal, notice: "Created goal successfully"
    else
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update_attributes
      redirect_to @goal, notice: "Saved changes successfully"
    else
      render :edit
    end
  end

  def destroy
    @goal.find(params[:id]).destroy

    redirect_to goals_url, notice: "Deleted goal successfully"
  end

  def mark_completed
    @goal = Goal.find(params[:id])
    @goal.mark_completed!

    redirect_to @goal, notice: "Good job completing '#{@goal.title}'!"
  end

end
