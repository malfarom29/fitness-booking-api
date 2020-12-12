class ScheduleActivityUser::Booker < BaseService
  def initialize(user, schedule_activity)
    @user = user
    @schedule_activity = schedule_activity
  end

  def call
    @user.schedule_activities << @schedule_activity
    @user.save!
    notify_booking
    @user.schedule_activities
  end

  private

  def notify_booking
    id = ScheduleActivityUser.find_by(user: @user, schedule_activity: @schedule_activity).id

    BookingMailer.booked_activity(id).deliver_later
  end
end
