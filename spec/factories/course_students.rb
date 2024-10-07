FactoryBot.define do
  factory :course_student do
    course
    student { create(:user, :student) }
  end
end
