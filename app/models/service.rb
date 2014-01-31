class Service < ActiveRecord::Base
  belongs_to :category, :class_name => "Category", :foreign_key => "category_id"
  #has_many :employee_services, :class_name => "EmployeeService", :foreign_key => "service_id"
  #has_many :categories, :class_name => "Category", :through => :employee_services
  
  #accepts_nested_attributes_for :category
  #accepts_nested_attributes_for :employee_services
  
  validates :category_id, presence: true
  validates :text, presence: true
end
