FactoryGirl.define do
  factory :profile do
    sequence(:description){ |n| "Test description(#{n})" }
    sequence(:display_name){ |n| "tester name #{n}" }
    sequence(:email){ |n| "tester#{n}@example.com" }
  end
end
