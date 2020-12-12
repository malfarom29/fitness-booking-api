require 'rails_helper'

RSpec.describe "Api::Admin::ScheduleActivities", type: :request do
  path '/admin/schedule_activities' do
    post 'Schedule an activity' do
      tags 'Activity Scheduling'
      description 'Schedule an activity to be available for clients'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :schedule_activity, in: :body, schema: {
        type: :object,
        properties: {
          schedule_activity: {
            properties: {
              schedule_id: { type: :integer },
              activity_id: { type: :integer },
              seats: { type: :integer }
            },
            required: %i[schedule_id activity_id seats]
          }
        }
      }

      response '200', 'Scheduled a new activity' do
        let(:schedule) { create(:schedule) }
        let(:activity) { create(:activity) }
        let(:schedule_activity) { { schedule_activity: { schedule_id: schedule.id, activity_id: activity.id, seats: 5 } } }
        include_context 'autogenerated example'
      end
    end
  end
end
