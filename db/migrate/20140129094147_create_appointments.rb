class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :client_id
      t.integer :employee_id
      t.integer :service_id
      t.datetime :appointment_date
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
