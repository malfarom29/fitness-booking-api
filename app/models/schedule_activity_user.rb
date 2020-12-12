class ScheduleActivityUser < ApplicationRecord
  belongs_to :schedule_activity
  belongs_to :user

  validates_uniqueness_of :user_id, scope: [:schedule_activity_id]
end
