# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Api::Admin::Activities', type: :request do
  path '/admin/activities' do
    post 'Creates a new activity' do
      tags 'Activities'
      security [bearerAuth: []]
      description 'On this endpoint the admin is able to create a new activity'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :activity, in: :body, schema: {
        type: :object,
        properties: {
          activity: {
            type: :object,
            properties: {
              name: { type: :string },
              description: { type: :string },
              mode: { type: :string, enum: %w[outdoor indoor virtual] }
            },
            required: %i[name mode]
          }
        }
      }

      response '201', 'New activity created' do
        let(:activity) { { activity: { name: 'foo', description: 'bar', mode: 'outdoor' } } }
        include_context 'generate admin token'
        include_context 'autogenerated example'
      end

      response '403', 'Forbidden' do
        let(:activity) { { activity: { name: 'foo', description: 'bar', mode: 'outdoor' } } }
        include_context 'generate client token'
        include_context 'autogenerated example'
      end

      response '422', 'Missing properties or Invalid Values' do
        let(:activity) { { activity: { description: 'bar', mode: 'outdoor' } } }
        include_context 'generate admin token'
        include_context 'autogenerated example'
      end
    end

    get 'List of activities' do
      tags 'Activities'
      description 'Shows a list of activities'
      security [bearerAuth: []]
      produces 'application/json'

      response '200', 'List of Activities' do
        include_context 'generate admin token'
        include_context 'autogenerated example'
      end

      response '403', 'Forbidden' do
        include_context 'generate client token'
        include_context 'autogenerated example'
      end
    end
  end

  path '/admin/activities/{id}' do
    parameter name: :id, in: :path, type: :string

    let!(:new_activity) { create(:activity) }
    let!(:id) { new_activity.id }

    patch 'Updates an activity' do
      tags 'Activities'
      description 'It updates requested fields from an specific activity'
      security [bearerAuth: []]
      consumes 'application/json'
      parameter name: :activity, in: :body, schema: {
        properties: {
          activity: {
            type: :object,
            properties: {
              name: { type: :string },
              description: { type: :string },
              mode: { type: :string, enum: %w[outdoor indoor virtual] }
            }
          }
        }
      }

      response '200', 'Updated' do
        let(:activity) { { activity: { name: 'new name' } } }
        include_context 'generate admin token'
        include_context 'autogenerated example'
      end

      response '403', 'Forbidden' do
        let(:activity) { { activity: { name: 'new name' } } }
        include_context 'generate client token'
        include_context 'autogenerated example'
      end

      response '404', 'Not found' do
        let(:id) { 0 }
        let(:activity) { { activity: { name: 'new name' } } }
        include_context 'generate admin token'
        include_context 'autogenerated example'
      end
    end

    get 'Get an specific activity' do
      tags 'Activities'
      description 'Shows an specific activity'
      security [bearerAuth: []]
      produces 'application/json'

      response '200', 'Show activity' do
        include_context 'generate admin token'
        include_context 'autogenerated example'
      end

      response '403', 'Forbidden' do
        include_context 'generate client token'
        include_context 'autogenerated example'
      end

      response '404', 'Not found' do
        let(:id) { 0 }
        include_context 'generate admin token'
        include_context 'autogenerated example'
      end
    end
  end
end
