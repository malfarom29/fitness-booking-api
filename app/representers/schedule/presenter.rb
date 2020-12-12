class Schedule::Presenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :begin_at, exec_context: :decorator
  property :finish_at, exec_context: :decorator

  def begin_at
    Time.zone.parse(represented.begin_at.to_s).to_time
  end

  def finish_at
    Time.zone.parse(represented.finish_at.to_s).to_time
  end
end
