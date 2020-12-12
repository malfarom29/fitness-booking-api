class User < ApplicationRecord
  devise :database_authenticatable

  has_many :schedule_activity_users
  has_many :schedule_activities, through: :schedule_activity_users

  enum role: {
    admin: 'admin',
    client: 'client'
  }
end
