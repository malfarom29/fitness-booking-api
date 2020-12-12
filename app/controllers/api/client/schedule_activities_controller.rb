class Api::Client::ScheduleActivitiesController < ApplicationController
  def index
    schedule_activities = ScheduleActivity.all
    render json: {
      data: ScheduleActivity::Presenter.for_collection.new(schedule_activities)
    }
  end

  private

  def authorize_request!
    authorize [:Client, ScheduleActivity]
  end
end
