class CreateWeeklySchedules < ActiveRecord::Migration
  def change
    create_table :weekly_schedules do |t|
      
      t.integer :employee_id, null: false
      t.integer :workday_id, null: false
      t.string :start_time, null: false, limit: 5
      t.string :end_time, null: false, limit: 5
      t.boolean :active, null: false, default: true
      
      t.timestamps
    end
    
    add_index "weekly_schedules", ["employee_id"], name: "index_weekly_schedules_on_employee_id", using: :btree
    add_index "weekly_schedules", ["workday_id"], name: "index_weekly_schedules_on_workday_id", using: :btree
    add_index "weekly_schedules", ["employee_id","workday_id"], name: "index_weekly_schedules_on_employee_id_workday_id", using: :btree
  end
end
