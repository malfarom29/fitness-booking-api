class Activity::Presenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :name
  property :description
  property :mode
end
