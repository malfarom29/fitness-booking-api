require 'rails_helper'

RSpec.shared_context 'autogenerated example' do
  run_test!

  after do |example|
    example.metadata[:response][:examples] = {
      'application/json' => JSON.parse(response.body, symbolize_names: true)
    }
  end
end
