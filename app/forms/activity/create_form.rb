class Activity::CreateForm
  include ActiveModel::Model

  attr_accessor :name, :description, :mode

  validates :name, :mode, presence: true
  validates :mode, inclusion: { in: Activity.modes.keys }

  def validate!
    raise ActiveRecord::RecordInvalid, self unless valid?

    Activity.new(attributes)
  end

  private

  def attributes
    {
      name: name,
      description: description,
      mode: mode
    }
  end
end
