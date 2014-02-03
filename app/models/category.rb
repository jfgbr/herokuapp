class Category < ActiveRecord::Base
  has_many :services
  has_many :appointments, :through => :services
  #has_many :employee_services, :class_name => "EmployeeService", :through => :services
  #has_many :employees, :class_name => "User", :through => :employee_services
  #accepts_nested_attributes_for :services
  #accepts_nested_attributes_for :employee_services
end
