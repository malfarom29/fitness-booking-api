class CreateScheduleActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :schedule_activities do |t|
      t.references :schedule, foreign_key: true
      t.references :activity, foreign_key: true
      t.integer :seats, null: false
      t.integer :taken_seats, null:false, default: 0
      t.timestamps
    end
  end
end
