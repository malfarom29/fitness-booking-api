# frozen_string_literal: true

class Resources::Finder < BaseService
  def initialize(model, id)
    @model = model
    @id = id
  end

  def call
    @model.find(@id)
  end
end
