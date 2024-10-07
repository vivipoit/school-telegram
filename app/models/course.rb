class Course < ApplicationRecord
  belongs_to :teacher, -> { faculty }, class_name: "User"
  belongs_to :teacher_assistant, -> { faculty }, class_name: "User", optional: true
  has_many :course_students
  has_many :students, -> { student }, through: :course_students
end
