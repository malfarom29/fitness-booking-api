class ScheduleActivity::CreateForm
  include ActiveModel::Model

  attr_accessor :activity_id, :schedule_id, :seats

  validates :activity_id, :schedule_id, :seats, presence: true
  validates :seats, numericality: { greater_than: 0 }

  def validate!
    raise ActiveRecord::RecordInvalid, self unless valid?

    ScheduleActivity.new(attributes)
  end

  private

  def attributes
    {
      activity_id: activity_id,
      schedule_id: schedule_id,
      seats: seats
    }
  end
end
