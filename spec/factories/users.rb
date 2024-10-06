TEST_USER_PASSWORD = 'hard-2-guess'

FactoryBot.define do
  factory :user do
    email_address { |n| "user#{n}@email.com" }
    password { TEST_USER_PASSWORD }

    trait :administration do
      role { :administration }
    end

    trait :faculty do
      role { :faculty }
    end

    trait :student do
      role { :student }
    end
  end
end
