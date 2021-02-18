class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    @courses = Course.all.limit(3)
    @top_rated_courses = Course.limit(3).order('RANDOM()')
    @latest_courses = Course.all.limit(3).order(created_at: :desc)
  end

  def landing_page
  end

  def privacy_policy
  end
end
