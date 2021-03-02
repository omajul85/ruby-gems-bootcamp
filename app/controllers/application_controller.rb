class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :authenticate_user!

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :set_global_variables, if: :user_signed_in?

  def set_global_variables
    # navbar search
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search)
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
