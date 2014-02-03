class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :client_id, null: false
      t.integer :employee_service_id, null: false
      t.datetime :appointment_date, null: false
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
