class Api::Admin::ScheduleActivitiesController < ApplicationController
  def create
    valid_schedule_activity = ScheduleActivity::CreateForm.new(schedule_activity_params).validate!
    schedule_activity = Resources::Saver.call(valid_schedule_activity)
    render json: {
      data: ScheduleActivity::Presenter.new(schedule_activity)
    }
  end

  private

  def schedule_activity_params
    params.require(:schedule_activity).permit(:schedule_id, :activity_id, :seats)
  end

  def authorize_request!
    authorize [:Admin, ScheduleActivity]
  end
end
