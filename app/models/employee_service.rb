class EmployeeService < ActiveRecord::Base
  belongs_to :employee, :class_name => "User", :foreign_key => "employee_id"
  belongs_to :service, :class_name => "Service", :foreign_key => "service_id"
  
  has_many :category, :class_name => "Category", :through => :service
  
end
