FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'test123' }
  end

  trait :with_role_admin do
    role { :admin }
  end

  trait :with_role_client do
    role { :client }
  end
end
