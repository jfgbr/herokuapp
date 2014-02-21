class CreateScheduleTypes < ActiveRecord::Migration
  def change
    create_table :schedule_types do |t|
      t.string :text, null: false
    end
  end
end
