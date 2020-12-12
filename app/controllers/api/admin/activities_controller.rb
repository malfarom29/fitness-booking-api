class Api::Admin::ActivitiesController < ApplicationController
  def index
    activities = Activity.all
    render json: {
      data: Activity::Presenter.for_collection.new(activities)
    }
  end

  def create
    valid_activity = Activity::CreateForm.new(activity_params).validate!
    activity = Resources::Saver.call(valid_activity)
    render json: {
      data: Activity::Presenter.new(activity)
    }, status: :created
  end

  def update
    valid_activity = Activity::UpdateForm.new(activity_params.merge({ id: @resource.id })).validate!
    activity = Resources::Saver.call(valid_activity)
    render json: {
      data: Activity::Presenter.new(activity)
    }, status: :ok
  end

  def show
    render json: {
      data: @resource
    }
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :mode)
  end

  def authorize_request!
    authorize [:Admin, Activity]
  end
end
