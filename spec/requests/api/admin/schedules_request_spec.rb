require 'rails_helper'

RSpec.describe "Api::Admin::Schedules", type: :request do
  path '/admin/schedules' do
    post 'Add a new schedule' do
      tags 'Schedules'
      description 'Add a schedule available for activities. This schedules may have many activities. For example, from 8AM to 10AM can be scheduled a swimming session and a boxing session'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :schedule, in: :body, schema: {
        type: :object,
        properties: {
          schedule: {
            type: :object,
            properties: {
              begin_at: { type: :string, format: 'date-time' },
              finish_at: { type: :string, format: 'date-time' }
            },
            required: %i[begin_at finish_at]
          }
        }
      }

      response '200', 'Create a new schedule' do
        begin_at = 1.hour.from_now
        finish_at = begin_at + 2.hours
        let(:schedule) { { schedule: { begin_at: begin_at, finish_at: finish_at } } }
        include_context 'autogenerated example'
      end

      response '422', 'Invalid values' do
        begin_at = 1.hour.ago
        finish_at = begin_at + 2.hours
        let(:schedule) { { schedule: { begin_at: begin_at, finish_at: finish_at } } }
        include_context 'autogenerated example'
      end
    end
  end
end
