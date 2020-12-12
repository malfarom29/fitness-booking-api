# frozen_string_literal: true

require 'swagger_helper'

describe 'OAuth' do
  path '/oauth/token' do
    post 'Get access token' do
      tags 'OAuth'
      description 'Enter the username (email), password and grant type in order to get the access token, which will be necessary to access to the endpoints depending on the user role'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :auth, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string },
          grant_type: { type: :string, enum: [:password] }
        },
        required: %i[username password grant_type]
      }

      response '200', 'Get access token' do
        let(:user) { create(:user) }
        let(:auth) { { username: user.email, password: 'test123', grant_type: 'password' } }
        include_context 'autogenerated example'
      end
    end
  end
end
