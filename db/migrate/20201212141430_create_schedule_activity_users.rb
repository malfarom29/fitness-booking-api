class CreateScheduleActivityUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :schedule_activity_users do |t|
      t.references :schedule_activity, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end

    add_index :schedule_activity_users, %i[schedule_activity_id user_id], unique: true, name: :unique_pair_of
  end
end
