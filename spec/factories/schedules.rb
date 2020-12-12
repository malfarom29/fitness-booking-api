FactoryBot.define do
  factory :schedule do
    begin_at { 1.hour.from_now }
    finish_at { 2.hours.from_now }
  end
end
