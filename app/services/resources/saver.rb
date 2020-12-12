# frozen_string_literal: true

class Resources::Saver < BaseService
  def initialize(resource)
    @resource = resource
  end

  def call
    @resource.save!
    @resource
  end
end
