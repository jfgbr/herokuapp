class CreateEmployeeServices < ActiveRecord::Migration
  def change
    create_table :employee_services do |t|
      t.integer :employee_id
      t.integer :service_id

      t.timestamps
    end
  end
end
