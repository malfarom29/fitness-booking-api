class Schedule < ApplicationRecord
  has_many :schedule_activities
  has_many :activities, through: :schedule_activities
end
