class DashboardController < ApplicationController
  def index
    @courses = Course.list_for(authenticated_user)

    if authenticated_user.administration?
      @new_course = Course.new
      @teachers = User.faculty
      @students = User.student
    end
  end
end
