class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :client_id, null: false
      t.integer :employee_id, null: false
      t.integer :category_id, null: false
      t.integer :service_id, null: false
      t.integer :schedule_id, null: false
      #t.date :appointment_date, null: false
      #t.time :appointment_time, null: false
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
