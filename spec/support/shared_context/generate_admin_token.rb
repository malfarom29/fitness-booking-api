require 'rails_helper'

RSpec.shared_context 'generate admin token' do
  let(:admin) { create(:user, :with_role_admin) }
  let(:auth) { Doorkeeper::AccessToken.create!(resource_owner_id: admin.id, scopes: 'public') }
  let(:Authorization) { "Bearer #{auth.token}" }
end
