class Schedule::CreateForm
  include ActiveModel::Model

  attr_accessor :begin_at, :finish_at

  validates :begin_at, :finish_at, presence: true
  validate :begin_at_date?
  validate :finish_at_date?
  validate :begin_at_greater_than_now

  def validate!
    raise ActiveRecord::RecordInvalid, self unless valid?

    Schedule.new(attributes)
  end

  private

  def begin_at_greater_than_now
    errors.add(:begin_at, 'must be greater than actual date') unless Time.zone.parse(begin_at) > Time.current
  end

  def finish_at_greater_than_begin_at
    return if Time.zone.parse(finish_at) > Time.zone.parse(begin_at)

    errors.add(:finish_at, 'must be greater than begin_at date')
  end

  def begin_at_date?
    errors.add(:begin_at, 'is not a valid date') unless Time.zone.parse(begin_at)
  end

  def finish_at_date?
    errors.add(:finish_at, 'is not a valid date') unless Time.zone.parse(finish_at)
  end

  def attributes
    {
      begin_at: begin_at,
      finish_at: finish_at
    }
  end
end
