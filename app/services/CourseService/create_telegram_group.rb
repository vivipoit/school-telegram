module CourseService
  class CreateTelegramGroup
    def initialize(course)
      @course = course
    end

    def call
      return false if @course.telegram_group_link.present?

      group = TelegramClient.create_group(group_title, link_title)
      return false if group.blank?

      @course.update(telegram_group_link: group[:invite_link])
    end

    private

    def group_title
      "##{@course.id} #{@course.subject} #{@course.teacher.email_address}"
    end

    def link_title
      "##{@course.id} #{DateTime.current}"
    end
  end
end
