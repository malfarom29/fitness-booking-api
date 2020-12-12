class ApplicationController < ActionController::API
  before_action :set_resource, only: %i[update show]
  include ExceptionHandler

  def set_resource
    resource_name = self.class.to_s.split('::')
                        .last
                        .gsub('Controller', '')
                        .singularize
                        .safe_constantize
    @resource = Resources::Finder.call(resource_name, params[:id])
  end
end
