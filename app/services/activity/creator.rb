# frozen_string_literal: true

class Activity::Creator < BaseService
  def initialize(activity)
    @activity = activity
  end

  def call
    @activity.save!
    @activity
  end
end
