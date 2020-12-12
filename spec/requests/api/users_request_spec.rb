require 'rails_helper'

RSpec.describe "Api::Users", type: :request do
  path '/users/register' do
    post 'Register a user' do
      tags 'Users'
      description 'On this endpoint a new user can be registered. Once the user is registered successfully, use the /oauth/token endpoint to obtain an access token'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              first_name: { type: :string },
              last_name: { type: :string },
              email: { type: :string },
              password: { type: :string }
            },
            required: %i[first_name last_name email password]
          }
        }
      }

      response '204', 'New user created' do
        let(:user) { { user: { first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com', password: 'johndoe123' } }}
        run_test!
      end
    end
  end
end
