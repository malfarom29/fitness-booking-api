# frozen_string_literal: true

require 'swagger_helper'

describe 'Finder' do
  describe 'Activity' do
    let!(:activity) { create(:activity) }

    context 'when an activity is found' do
      it 'should return it' do
        expect(Resources::Finder.call(Activity, activity.id)).to be_a Activity
      end
    end

    context 'when an activity is not found' do
      it 'should throw RecordNotFound exception' do
        expect { Resources::Finder.call(Activity, -1) }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
