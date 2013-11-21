class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper

  def must_be_logged_in
    unless logged_in?
      redirect_to new_session_url, alert: "You must be logged in!"
    end
  end

  def require_user_with_permission
    @goal = Goal.find(params[:id])

    unless (logged_in? && @goal.user_id == current_user.id) || !@goal.is_private?
      redirect_to new_session_url, alert: "You don't have permission for that!"
    end
  end

  def require_owner
    @goal ||= Goal.find(params[:id])

    unless logged_in? && @goal.user_id == current_user.id
      redirect_to new_session_url, alert: "You don't have permission for that!"
    end
  end

end
