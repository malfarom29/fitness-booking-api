class Client::ScheduleActivityPolicy < ApplicationPolicy
  def index?
    user.client?
  end

  def available?
    user.client?
  end

  def book?
    user.client?
  end
end
