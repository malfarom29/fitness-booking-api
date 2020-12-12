class ApplicationController < ActionController::API
  include Pundit
  include ExceptionHandler

  before_action :doorkeeper_authorize!
  before_action :authorize_request!
  before_action :set_resource, only: %i[update show book]

  private

  def set_resource
    resource_name = self.class.to_s.split('::')
                        .last
                        .gsub('Controller', '')
                        .singularize
                        .safe_constantize
    @resource = Resources::Finder.call(resource_name, params[:id])
  end

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def current_user
    @current_user ||= current_resource_owner
  end
end
