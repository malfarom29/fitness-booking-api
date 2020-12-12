class Activity::UpdateForm
  include ActiveModel::Model

  attr_accessor :id, :name, :description, :mode

  validates :id, presence: true

  def validate!
    raise ActiveRecord::RecordInvalid, self unless valid?

    activity = Activity.find(id)
    activity.assign_attributes(attributes.compact)
    activity
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
