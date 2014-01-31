class AddDetailsToEmployeeService < ActiveRecord::Migration
  def change
    add_index "employee_services", ["employee_id"], name: "index_employee_services_on_employee_id", using: :btree
    add_index "employee_services", ["service_id"], name: "index_employee_services_on_service_id", using: :btree
  end
end
