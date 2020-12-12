class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.datetime :begin_at, null: false
      t.datetime :finish_at, null: false
      t.timestamps
    end
  end
end
