# frozen_string_literal: true

class Activity < ApplicationRecord
  has_many :schedule_activities
  has_many :schedules, through: :schedule_activities

  enum mode: {
    outdoor: 'outdoor',
    indoor: 'indoor',
    virtual: 'virtual'
  }
end
