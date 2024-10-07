class DashboardController < ApplicationController
  def index
    if authenticated_user.administration?
      @courses = Course.all
      @new_course = Course.new
      @teachers = User.faculty
      @students = User.student
    end
  end
end
