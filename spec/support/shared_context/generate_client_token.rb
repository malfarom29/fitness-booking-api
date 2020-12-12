require 'rails_helper'

RSpec.shared_context 'generate client token' do
  let(:client) { create(:user, :with_role_client) }
  let(:auth) { Doorkeeper::AccessToken.create!(resource_owner_id: client.id, scopes: 'public') }
  let(:Authorization) { "Bearer #{auth.token}" }
end

