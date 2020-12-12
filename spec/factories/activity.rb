# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    mode { Activity.modes.keys.sample }
  end
end
