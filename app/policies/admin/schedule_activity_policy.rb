class Admin::ScheduleActivityPolicy < ApplicationPolicy
  def create?
    user.admin?
  end
end
