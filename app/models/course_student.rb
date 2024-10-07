class CourseStudent < ApplicationRecord
  belongs_to :course
  belongs_to :student, -> { student }, class_name: "User"
end
