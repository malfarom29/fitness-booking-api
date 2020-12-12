class Client::ScheduleActivityPolicy < ApplicationPolicy
  def index?
    user.client?
  end
end
