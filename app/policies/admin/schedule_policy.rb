class Admin::SchedulePolicy < ApplicationPolicy
  def create?
    user.admin?
  end
end
