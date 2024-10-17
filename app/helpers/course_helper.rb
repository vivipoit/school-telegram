module CourseHelper
  def course_telegram_group_link(course)
    if course.telegram_group_link.present?
      link_to "join telegram group", course.telegram_group_link, target: "_blank"
    elsif authenticated_user.administration?
      button_to "create telegram group", create_telegram_group_course_path(course)
    end
  end
end
