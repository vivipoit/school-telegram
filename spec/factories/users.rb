TEST_USER_PASSWORD = 'hard-2-guess'

FactoryBot.define do
  factory :user do
    sequence(:email_address) { |n| "user#{n}@email.com" }
    password { TEST_USER_PASSWORD }

    trait :administration do
      sequence(:email_address) { |n| "administration#{n}@email.com" }
      role { :administration }
    end

    trait :faculty do
      sequence(:email_address) { |n| "faculty#{n}@email.com" }
      role { :faculty }
    end

    trait :student do
      sequence(:email_address) { |n| "student#{n}@email.com" }
      role { :student }
    end
  end
end
