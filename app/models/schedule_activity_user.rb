class ScheduleActivityUser < ApplicationRecord
  belongs_to :schedule_activity
  belongs_to :user

  counter_culture :schedule_activity, column_name: :taken_seats

  validates_uniqueness_of :user_id, scope: [:schedule_activity_id]
end
