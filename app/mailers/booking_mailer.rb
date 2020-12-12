class BookingMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def booked_activity(scheduled_activity_user_id)
    scheduled_activity_user = Resources::Finder.call(ScheduleActivityUser, scheduled_activity_user_id)
    scheduled_activity = scheduled_activity_user.schedule_activity

    @user = scheduled_activity_user.user
    @activity = scheduled_activity.activity
    @schedule = scheduled_activity.schedule

    mail(to: @user.email, subject: 'You are booked an activity')
  end
end
