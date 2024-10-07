class CoursesController < ApplicationController
  def create
    @course = Course.new(course_params)

    alert = @course.save ? "created" : "failed"

    redirect_to root_path, alert: alert
  end

  private

  def course_params
    params.require(:course).permit(:subject, :teacher_id, :teacher_assistant_id, student_ids: [])
  end
end
