class ScheduleActivityUser::Booker < BaseService
  def initialize(user, schedule_activity)
    @user = user
    @schedule_activity = schedule_activity
  end

  def call
    @user.schedule_activities << @schedule_activity
    @user.save!
    @user.schedule_activities
  end
end
