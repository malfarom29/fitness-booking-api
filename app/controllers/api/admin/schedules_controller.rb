class Api::Admin::SchedulesController < ApplicationController
  def create
    valid_schedule = Schedule::CreateForm.new(schedule_params).validate!
    schedule = Resources::Saver.call(valid_schedule)
    render json: {
      data: Schedule::Presenter.new(schedule)
    }
  end

  private

  def schedule_params
    params.require(:schedule).permit(:begin_at, :finish_at)
  end
end
