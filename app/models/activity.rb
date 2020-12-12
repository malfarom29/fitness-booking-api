# frozen_string_literal: true

class Activity < ApplicationRecord
  enum mode: {
    outdoor: 'outdoor',
    indoor: 'indoor',
    virtual: 'virtual'
  }
end
