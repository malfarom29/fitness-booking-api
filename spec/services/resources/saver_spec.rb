require 'rails_helper'

describe 'Saver' do
  describe 'Activities' do
    describe 'Create' do
      context 'when description is not present' do
        it 'should save it without description' do
          activity = Activity.new(name: 'foo', mode: 'outdoor')
          expect { Resources::Saver.call(activity) }.to change { Activity.count }.by(1)
        end
      end

      context 'when missing activity name' do
        it 'should throw NotNullViolation Exception' do
          activity = Activity.new(mode: 'outdoor', description: 'bar')
          expect { Resources::Saver.call(activity) }.to raise_error(ActiveRecord::NotNullViolation)
        end
      end
    end

    describe 'Update' do
      let!(:activity) { create(:activity, name: 'foo') }

      it 'should update activity name' do
        expect(activity.name).to eq('foo')
        activity.name = 'foo2'
        expect { Resources::Saver.call(activity) }.to change(activity, :updated_at)
        expect(activity.reload.name).to eq('foo2')
      end
    end
  end
end
