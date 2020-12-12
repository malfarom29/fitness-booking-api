FactoryBot.define do
  factory :schedule_activity do
    seats { rand(5..20) }
  end
end
