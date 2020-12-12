class ScheduleActivity::Presenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :schedule, decorator: Schedule::Presenter
  property :activity, decorator: Activity::Presenter
  property :taken_seats
  property :seats
end
