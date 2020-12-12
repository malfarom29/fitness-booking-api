class ScheduleActivity < ApplicationRecord
  belongs_to :schedule
  belongs_to :activity

  has_many :schedule_activity_users
  has_many :users, through: :schedule_activity_users

  validates :seats, numericality: { greater_than: :taken_seats }
end
