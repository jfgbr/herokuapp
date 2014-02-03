class EmployeeService < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "employee_id"
  belongs_to :service, :class_name => "Service", :foreign_key => "service_id"
  
  #has_many :services, :class_name => "Service", :through => :service
  #has_many :category, :class_name => "Category", :through => :service
  
  #accepts_nested_attributes_for :service
  
end
