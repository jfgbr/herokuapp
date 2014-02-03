class AddDetailsToAppointment < ActiveRecord::Migration
  def change
    add_index "appointments", ["client_id"], name: "index_appointments_on_client_id", using: :btree
    add_index "appointments", ["employee_service_id"], name: "index_appointments_on_employee_service_id", using: :btree
    #add_reference :appointments, :user, index: true
    #add_reference :appointments, :service, index: true
  end
end
