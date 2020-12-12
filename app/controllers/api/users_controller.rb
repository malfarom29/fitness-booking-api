class Api::UsersController < ApplicationController
  skip_before_action :doorkeeper_authorize!
  skip_before_action :authorize_request!

  def create
    valid_user = User::RegisterForm.new(user_params).validate!
    user = Resources::Saver.call(valid_user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
