describe 'ScheduleActivityUser::Booker' do
  before do
    activity = create(:activity)
    schedule = create(:schedule)
    @user = create(:user, :with_role_client)
    @schedule_activity = create(:schedule_activity, activity: activity, schedule: schedule)
  end

  context 'when booking an activity' do
    it 'should book a scheduled activity' do
      ScheduleActivityUser::Booker.call(@user, @schedule_activity)
      @user.reload
      expect(@user.schedule_activities.size).to eq(1)
    end
  end

  context 'when booking an already booked activity' do
    it 'should throw RecordInvalid exception' do
      ScheduleActivityUser::Booker.call(@user, @schedule_activity)
      expect { ScheduleActivityUser::Booker.call(@user, @schedule_activity) }.to raise_error ActiveRecord::RecordInvalid
    end
  end

  describe 'no seats available' do
    let(:activity) { create(:activity) }
    let(:schedule) { create(:schedule) }
    let(:user) { create(:user, :with_role_client) }
    let(:schedule_activity) { create(:schedule_activity, activity: activity, schedule: schedule, seats: 2, taken_seats: 2) }

    context 'when taken seats is equal to seats' do
      it 'should not book a new activity' do
        expect { ScheduleActivityUser::Booker.call(user, schedule_activity) }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
