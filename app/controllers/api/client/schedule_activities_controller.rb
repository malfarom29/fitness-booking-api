class Api::Client::ScheduleActivitiesController < ApplicationController
  def index
    schedule_activities = ScheduleActivity.all
    render json: {
      data: ScheduleActivity::Presenter.for_collection.new(schedule_activities)
    }
  end

  def book
    user_scheduled_activities = ScheduleActivityUser::Booker.call(@current_user, @resource)
    render json: {
      data: ScheduleActivity::Presenter.for_collection.new(user_scheduled_activities)
    }
  end

  private

  def authorize_request!
    authorize [:Client, ScheduleActivity]
  end
end
