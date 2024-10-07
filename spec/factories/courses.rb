FactoryBot.define do
  factory :course do
    subject { 'math' }
    teacher { create(:user, :faculty) }
    teacher_assistant { create(:user, :faculty) }
  end
end
