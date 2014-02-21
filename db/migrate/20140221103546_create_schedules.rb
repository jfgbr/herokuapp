class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      
      #t.integer :employee_id, null: false
      #t.integer :weekday_id, null: false
      t.integer :weekly_schedule_id, null: false
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.integer :schedule_type_id, null: false, default: 1 #appointment
      
      t.timestamps
    end
    
    #add_index "weekly_schedules", ["employee_id"], name: "index_weekly_schedules_on_employee_id", using: :btree
    #add_index "weekly_schedules", ["weekday_id"], name: "index_weekly_schedules_on_weekday_id", using: :btree
    add_index "schedules", ["weekly_schedule_id"], name: "index_weekly_schedules_on_weekly_schedule_id", using: :btree
    add_index "schedules", ["date"], name: "index_weekly_schedules_on_date", using: :btree
    
  end
end
